# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  # Customize the actions as needed. For example:
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource.otp_required_for_login
      # Redirect user to OTP flow if enabled
      session[:otp_user_id] = resource.id
      redirect_to user_two_factor_authentication_path
    else
      # Default behavior
      super
    end
  end
end
