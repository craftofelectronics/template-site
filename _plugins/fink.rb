module Jekyll
  class FinkBlock < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      arr = @text.split(" ")
      tag = arr[0]
      random = rand(1000000).to_s;
      elements = arr.slice(1,6)
      
      html = "<div> <span id='" + tag + random + "'> </span> "
      html += "<script type=\"text/javascript\"> "
      html += "fink('" + tag + "', "
      html += "'" + tag + random + "', 0 "
      
      elements.each do |elem|
        html += " | fink." + elem
      end
            
      html += "); </script> "
      html += "</div>"
      html
      
    end
  end
end

Liquid::Template.register_tag('fink', Jekyll::FinkBlock)