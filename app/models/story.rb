require 'redcarpet'

class Story < ApplicationRecord
	belongs_to :user
	has_many :taggings
	has_many :tags, through: :taggings

	after_save :save_content_as_markdown

	validates :title, presence: true

	scope :user_stories, lambda { |user| where(user_id: user.id)}
	scope :tagged_with, lambda { |tag| joins(:taggings).where('taggings.tag_id = '+tag.to_s)}

	def tag_list 
		self.tags.collect do |tag|
			tag.name
		end.join(", ")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect { |name | Tag.find_or_create_by(name: name)}
		self.tags = new_or_found_tags
	end

	def save_content_as_markdown
	  RedCarpetWorker.perform_async(self.content, self.id)
	end

	def self.search(search)
	  where("title LIKE ?", "%#{search}%")
	end
end
