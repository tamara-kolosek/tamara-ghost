class RedCarpetWorker
	include Sidekiq::Worker

	def perform(content, id)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		story = Story.find(id)
		story.update_column(:markdown_content, markdown.render(content).html_safe)
	end

end 
