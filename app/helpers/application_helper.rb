require 'redcarpet'

module ApplicationHelper

	def markdown_render(content)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		markdown.renderer(content)
	end

end
