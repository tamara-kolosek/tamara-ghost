class UserDecorator < Draper::Decorator
  delegate_all
  decorates :user

  def full_name 
  	model.full_name
  end

  def email 
  	model.email
  end

  def image
  	if model.image_file_name.nil?
  		h.image_tag("avatars/avatar_default")
  	else
  		h.image_tag(model.image.url)
  	end
  end

  def role 
    h.p("role")
  end
end
