class ApplicationController < ActionController::Base

  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :slug, :full_name, :bio, :role, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:slug, :full_name, :bio, :image, :role])
  end

  def current_user 
  	super&.decorate
  end

end
