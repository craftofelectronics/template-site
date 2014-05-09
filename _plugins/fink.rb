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
      
      html = "<div>\n<span id='" + tag + random + "'> </span>\n"
      html += "<script type=\"text/javascript\">\n"
      html += "\tfink('" + tag + "', "
      html += "'" + tag + random + "', 0 "
      
      elements.each do |elem|
        html += " | fink." + elem
      end
            
      html += ");\n</script>\n"
      html += "</div>\n\n"
      html
      
    end
  end
end

Liquid::Template.register_tag('finkblock', Jekyll::FinkBlock)