module UsersHelper
	def is_user_admin(user)
		user.role == "admin"
	end
end
