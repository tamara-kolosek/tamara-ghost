require 'redcarpet'

module StoryHelper

	def markdown_render(content)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		return markdown.render(content)
	end

end
