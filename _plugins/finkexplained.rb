module Jekyll
  class FinkExplained < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      arr = @text.split(" ")
      tag = arr[0]
      random = rand(1000000).to_s;
      elements = arr.slice(1,6)
      
      html = "<div class='row'>"
      html += "<div class='col-md-2'> <span id='" + tag + random + "'> </span> </div>\n"
      
      html += "<div class='col-md-5'>" + super + "</div>"
      html += "<script type=\"text/javascript\">\n"
      html += "\tfink('" + tag + "', "
      html += "'" + tag + random + "', 0 "
      
      elements.each do |elem|
        html += " | fink." + elem
      end
            
      html += ");\n</script>\n"
      html += "</div>"
      
      html
      
    end
  end
end

Liquid::Template.register_tag('finkexplained', Jekyll::FinkExplained)