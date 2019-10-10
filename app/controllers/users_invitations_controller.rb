class UsersInvitationsController < Devise::InvitationsController

	def invite_resource
      @email = params[:user][:email]
      @user = User.invite!(email: @email)
      @user.role = params[:user][:role]
      @user.save
      redirect_to users_path
  end
  
  def accept_resource
      resource = resource_class.accept_invitation!(update_resource_params)
      Analytics.report('invite.accept', resource.id)
      resource
  end

end
