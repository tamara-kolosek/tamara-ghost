class UsersInvitationsController < Devise::InvitationsController

	def invite_resource
      @email = params[:user][:email]
      @user = User.invite!(email: @email)
      @user.role = params[:user][:role]
      @user.save
      redirect_to users_path
    end

    # this is called when accepting invitation
    # should return an instance of resource class
    def accept_resource
      resource = resource_class.accept_invitation!(update_resource_params)
      # Report accepting invitation to analytics
      Analytics.report('invite.accept', resource.id)
      resource
    end

end
