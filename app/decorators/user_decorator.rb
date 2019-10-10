class UserDecorator < Draper::Decorator
  
  include ActionView::Helpers::DateHelper

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

  def last_seen
    if not model.last_login.nil?
      h.p("Last seen: "+distance_of_time_in_words(model.last_login, Time.now)+" ago")
    end
  end

  def team 
    h.link_to('Team', h.users_path, method: :get)
  end

  def stories
    h.link_to('Stories', h.story_index_path, method: :get)
  end 

  def password_change_link(current_user_id)
    if model.id == current_user_id
      h.link_to('Change your password', h.edit_user_registration_path, method: :get)
    end
  end 

end
