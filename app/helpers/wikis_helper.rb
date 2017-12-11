module WikisHelper
    def render_markdown_for(attribute)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
        markdown.render(attribute).html_safe
    end
end
