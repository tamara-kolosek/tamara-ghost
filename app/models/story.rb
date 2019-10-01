class Story < ApplicationRecord
	belongs_to :user

	scope :user_stories, lambda { |user| where(user_id: user.id)}
end
