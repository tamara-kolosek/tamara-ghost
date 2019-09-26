
class Users::SessionsController < Devise::SessionsController

  def new
     super
     redirect_to root_path
  end

  def show
  end

  def create
     super
  end

  def destroy
  	super
  end

end
