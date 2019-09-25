class Users::RegistrationsController < Devise::RegistrationsController
  
  def new
     super
  end

  def create
     super
     if(is_first_user)
      @user.role = 2
     else
      @user.role = 0
     @user.save
     current_user = @user
   end
  end

  def is_first_user
    User.all.size == 1
  end

end
