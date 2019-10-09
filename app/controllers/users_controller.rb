class UsersController < ApplicationController
	include Pundit
	
	def show
		@user = UserDecorator.find(params[:id]).decorate
	end

	def index
		if current_user.is_admin
			@users = Blog.find(current_user.blog_id).members.decorate
		else
			@users = current_user.decorate 
		end
		@users = Kaminari.paginate_array(@users).page(params[:page]).per(5)
		@invited_users = get_invited_users
	end

	def new_member
	  @user = User.new
	  respond_to do |format|
	    format.html
	    format.js
	  end
	end

	def get_invited_users
		User.where.not(invitation_token: [nil, ""])
	end

	def decorate_current_user
		@current_user = UserDecorator.find(current_user.id).decorate
	end
end
