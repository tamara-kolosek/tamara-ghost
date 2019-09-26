class Users::RegistrationsController < Devise::RegistrationsController
  
  def new
     super
  end

  def create
     super
     if(is_first_user)
      @user.role = 2
     else
      p sign_up_params
      @user.role = 0
      @user.slug(sign_up_params.slug)
      @user.full_name(sign_up_params.full_name)
      @user.bio(sign_up_params.bio)
     end
     @user.save
     current_user = @user
  end

  def edit
    super
  end

  def update
    super
    @user.role(sign_up_params.role)
    @user.slug(sign_up_params.slug)
    @user.full_name(sign_up_params.full_name)
    @user.bio(sign_up_params.bio)
    @user.save
  end

  def is_first_user
    User.all.size == 1
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

end
