
class Users::SessionsController < Devise::SessionsController

  def new
     super
  end

  def show
  end

  def create
     super
     current_user.last_login = Time.now
     current_user.save
     current_user.decorate
  end

  def destroy
  	super
  end

end
