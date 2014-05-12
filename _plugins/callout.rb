module Jekyll
  class CalloutTag < Liquid::Block

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      tag = @text
      tag.delete!("\n")
      tag.delete!(" ")
      
      if ['success'].include?(tag)
        @alert = 'success'
      elsif ['info'].include?(tag) 
        @alert = 'info'
      elsif ['warning'].include?(tag) 
        @alert = 'warning'
      elsif ['danger'].include?(tag)
        @alert = 'danger'
      end
      
      "<div style='margin: 15px;' class=\"bs-callout bs-callout-#{@alert}\">\n" + super + "\n</div>\n"
    end
  end
end

Liquid::Template.register_tag('callout', Jekyll::CalloutTag)