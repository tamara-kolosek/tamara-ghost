class StoryDecorator < Draper::Decorator

  include ActionView::Helpers::DateHelper

  delegate_all
  decorates :story

  def tag_links
	  model.tags.map do |tag|
	  	h.link_to(tag.name, h.tag_path(tag), method: :get)
	  end.join(",").html_safe
  end

  def is_from_users_team(user_blog_id)
    return model.user.blog_id == user_blog_id
  end

  def delete_link(user)
    if user.is_admin
      h.link_to("Delete", h.story_path(model.id), method: :delete, data: {confirm: "Really delete the story?"})
    end
  end

end
