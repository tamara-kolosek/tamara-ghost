class Story < ApplicationRecord
	belongs_to :user

	acts_as_taggable
	validates :title, presence: true

	scope :user_stories, lambda { |user| where(user_id: user.id)}
end
