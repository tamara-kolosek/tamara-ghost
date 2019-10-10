class UserRemoveWorker 
	include Sidekiq::Worker

	def perform(id)
		user_to_remove = User.find(id)
		user_to_remove.blog_id = nil
		user_to_remove.save
	end
end