class UsersInvitationsController < Devise::InvitationsController

	def invite_resource
    @user = User.invite!(email: params[:user][:email], role: params[:user][:role])
    @user.blog_id = current_user.blog_id
    @user.save
    redirect_to users_path
  end

  def accept_resource
    resource = resource_class.accept_invitation!(update_resource_params)
    Analytics.report('invite.accept', resource.id)
    resource
  end

end
