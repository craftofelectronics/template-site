module Jekyll
  class PadTag < Liquid::Tag
    
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end
   
    def render(context)
      arr = @text.split(" ")
      html = "<div style='padding:#{arr[0]}px;'> </div>"
      html
      
    end
  end
end

Liquid::Template.register_tag('pad', Jekyll::PadTag)