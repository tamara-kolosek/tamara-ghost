class UsersController < ApplicationController

	def show
		@user = UserDecorator.find(params[:id]).decorate
	end

	def index
		@users = User.all
	end

end
