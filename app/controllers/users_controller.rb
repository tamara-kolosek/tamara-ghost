class UsersController < ApplicationController
	include Pundit
	
	def show
		@user = UserDecorator.find(params[:id]).decorate
	end

	def index
		@users = current_user.members.decorate
		#@users = UserDecorator.all.decorate
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

	def remove_member
		@member = User.find(params[:id])
		current_user.team.delete_if { |user| user.id == params[:id] }
	end

	def get_invited_users
		User.where.not(invitation_token: [nil, ""])
	end

	def decorate_current_user
		@current_user = UserDecorator.find(current_user.id).decorate
	end
end
