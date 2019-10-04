require 'redcarpet'

class Story < ApplicationRecord
	belongs_to :user

	after_save :save_content_as_markdown

	acts_as_taggable
	validates :title, presence: true

	scope :user_stories, lambda { |user| where(user_id: user.id)}

	def save_content_as_markdown
	  RedCarpetWorker.perform_async(self.content, self.id)
	  #markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
	  #self.update_column(:markdown_content, markdown.render(self.content).html_safe)
	end
end
