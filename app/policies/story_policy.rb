class StoryPolicy < ApplicationPolicy 
	def index? 
		if curent_user.is_admin
			return Story.all
		else
			return Story.find(1)
		end
	end
end