module ApplicationHelper
    require 'redcarpet/render_strip'
    require 'video_markdown_renderer.rb'

    def has_role?(role)
      current_user && current_user.has_role?(role)
    end

    def has_coin?(coin)
      current_user && current_user.has_coin?(coin)
    end

    def comprar(coin)
      current_user.coin - 1
    end
  
    class CodeRayify < Redcarpet::Render::HTML
      def block_code(code, language)
        CodeRay.scan(code,language).div
      end
    end
  

    def markdown(text)
      coderayified = CodeRayify.new(:filter_html => false, :hard_wrap => true, link_attributes: { target: '_blank' })
      options = {
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        autolink: true,
        lax_html_blocks: true
      }
      markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
      markdown_to_html.render(text).html_safe
    end
  
    def strip_markdown(text)
      markdown_to_plain_text = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
      markdown_to_plain_text.render(text).html_safe
    end

    #navbar links
    def link_to_focus_navbar_item(text, href, class:)
        "<a href='#{href}#focus' class='#{'navbar-item'}'>#{text}</a>".html_safe
    end

    def link_to_focus_navbar(text, href, class:)
        "<a href='#{href}#focus' class='#{'navbar-item mr50'}'>#{text}</a>".html_safe
    end

    #buttons
    def link_to_focus_button(text, href, class:)
        "<a href='#{href}#focus' class='#{'button'}'>#{text}</a>".html_safe
    end

    def link_to_focus_button_dark(text, href, class:)
        "<a href='#{href}#focus' class='#{'button is-dark'}'>#{text}</a>".html_safe
    end

    def link_to_focus_button_info(text, href, class:)
        "<a href='#{href}#focus' class='#{'button is-info'}'>#{text}</a>".html_safe
    end

end
