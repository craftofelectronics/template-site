#lang racket

(require "create-pages.rkt")

(start-date (date* 0 0 0 6 1 2014 1 6 #f -18000 0 "EST"))
(end-date (date* 0 0 0 24 4 2014 5 115 #f -18000 0 "EST"))
(output-directory "appsforapp-")

(define (day-abbrev dow)
  (list-ref `(sun mon tue wed thur fri sat) dow))

(define mw
  (let ([counter 0])
    (λ ()
      (λ (the-date y m d yd dow)
        (cond
           [(sunday? the-date)
           (set! counter (add1 counter))
           `(page 
             (file ,(format "~a-~a-week~a.md"
                             (pad2 m) (pad2 d) counter))
             (yaml
              (title ,(format "Week ~a" counter))
              (date ,(format "~a~a~a" y (pad2 m) (pad2 d)))
              (layout default)
              (activity "arrow-up")
              (nolink "true")
              (release later))
             
             (content (blank 1))
             )]    
          [(mw? the-date)
           
           
           `(page
             (file ,(format "~a-~a-~a.md"
                            (pad2 m) (pad2 d) 
                            (day-abbrev dow)
                            ))
             (yaml
              (title "")
              (activity "")
              (date ,(format "~a~a~a" y (pad2 m) (pad2 d)))
              (layout default)
              (categories learn)
              (release later)
              )
             (content
              (blank 1)
              ))]
          )
        ))))




(define (generate-mw)
  (for-each 
   render-page 
   (generate-pages (reverse (make-list-of-dates)) 
                   (λ (d) (or  (sunday? d) (mw? d) ))
                   mw
                   (list))))

(generate-mw)