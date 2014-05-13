module Jekyll
  class AssessmentTag < Liquid::Tag
    
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end
   
    def render(context)
      arr = @text.split("|")
      html = ""
      html += "<div class='row' >"
      html += "<div class='col-md-1 text-right'>"
      # Assessment Number
      html += arr[0]
      html += '.</div>'
      # Activity
      html += "<div class='col-md-6 text-left'>"
      html += arr[3]
      html += "</div>"
      
      # Week
      html += "<div class='col-md-2 text-left'>"
      html += arr[1]
      html += "</div>"
      # Percent
      html += "<div class='col-md-1 text-center'>"
      html += arr[2]
      html += "</div>"  
      html += "</div>"
      
      html
      
    end
  end
end

Liquid::Template.register_tag('assessment', Jekyll::AssessmentTag)