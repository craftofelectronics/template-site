#lang racket

(require json
         net/http-client)

(define index (make-parameter 1))


(define (convert-value o)
  (match o
    [(? string? o) o]
    [(? integer? o) (format "~a" o)]
    [(? boolean? o) (if o "Yes" "No")]
    [(or 'true 'false) (if (equal? o 'true) "true" "false")]
    [(or 'yes 'no) (if (equal? o 'yes) "Yes" "No")]
    [(or 'e 'enable) "Enable"]
    [(or 'd 'disable) "Disable"]
    [(? symbol? o) (symbol->string o)]
    ))

(define (parse-check allowed-fields pieces)
  (define h (make-hash))
  (for ([piece pieces])
    (cond
      [(member (first piece) allowed-fields)
       (hash-set! h (first piece) (convert-value (second piece)))]
      [else
       (error 'parse-check "Disallowed field: ~a" piece)]
      ))
  h)


(define allowed-question-fields
  (make-hash '((header text)
               (text-area text required rows cols hint wysiwyg))))
(define question-types
  (make-hash '((header . control_head)
               (text-area . control_textarea))))

(define (parse-question question)
  (define h (make-hash))
  ;; Set the type. Throw an error for bad types.
  (hash-set! h 'type (convert-value (hash-ref question-types (first question) false)))
  (hash-set! h 'order (convert-value (index)))
  (hash-set! h 'name (format "~a-~a" (first question) (index)))
  (index (add1 (index)))
  (for ([field (rest question)])
    (cond
      [(member (first field) (hash-ref allowed-question-fields (first question) '()))
       (hash-set! h (first field) (convert-value (second field)))]
      [else
       (error 'parse-question "Unknown question type: ~a" field)]))
  h)

(define email-fields
  '(type name from to subject html))

(define (parse-email email)
  (define h (make-hash))
  (for ([field (rest email)])
    (cond
      [(member (first field) email-fields)
       (hash-set! h (first field) (convert-value (second field)))]
      [else
       (error 'parse-email "Unknown email field: ~a" field)]))
  h)

(define (merge-hashes h*)
  (define merged (make-hash))
  (for ([h h*])
    (hash-for-each 
     h (lambda (k v)
         (hash-set! merged k v))))
  merged)

(define (parse sexp)
  (match sexp
    [`(form ,pieces ...)
     (merge-hashes (map parse pieces))]
    [`(properties ,pieces ...)
     (make-hash `((properties
                   . 
                   ,(parse-check '(title height)
                                 pieces))))]
    [`(questions ,pieces ...)
     (make-hash `((questions
                   .
                   ,(map parse-question pieces))))]
    [`(emails ,pieces ...)
     (make-hash `((emails
                   .
                   ,(map parse-email pieces))))]
    
    [else
     (error 'parse "Unknown form element: ~a" sexp)
     ]))
                   
  
(define t1
  (parse 
   `(form
     (properties
      (title "Test 001")
      (height 600))
     (questions
      (header (text "A Question"))
      #;(text-area 
       (text "Click to expand to full screen.")
       (required yes)
       (rows 12)
       (cols 70)
       (hint "Your answer should probably be 2-3 paragraphs.")
       (wysiwyg enable)))
     (emails 
      (email
       (type "notification")
       (name "notification")
       (from "default")
       (to "matt@jadud.com")
       (subject ,(format "Form Submission: ~a" (current-seconds)))
       (html false))
     ))))

(define api-key (make-parameter "2f33a3c711d30178e85b3e169a4f4e0d"))
(define (post api form)
  (define json (jsexpr->string form))
  (display json) (newline)
  (http-sendrecv
   "api.jotform.com"
   (format "/v1~a" api)
   #:method #"POST"
   #:headers (list (string->bytes/locale (format "apiKey: ~a" (api-key))))
   #:data (string->bytes/locale json)))

(define (get api)
  (http-sendrecv
   "api.jotform.com"
   (format "/v1~a" api)
   #:method #"GET"
   #:headers (list (string->bytes/locale (format "apiKey: ~a" (api-key))))
   ))

(require net/url)
(current-proxy-servers
   (list (list "http" "127.0.0.1" 8888)))
(define (test-post)
  (let-values ([(code headers port)
                (post "/user/forms" t1)])
    (port->lines port)))
