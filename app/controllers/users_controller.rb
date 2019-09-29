class UsersController < ApplicationController

	def show
		@user = UserDecorator.find(params[:id]).decorate
	end

	def index
		@users = UserDecorator.all.decorate
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

end
