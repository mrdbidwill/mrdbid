# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  def create
    # Authenticate user credentials (password)
    self.resource = warden.authenticate(auth_options)

    if resource.nil?
      # Invalid credentials - show error
      flash[:alert] = "Invalid email or password."
      render :new and return
    end

    if resource.otp_required_for_login?
      # Check if device is trusted (has valid cookie)
      if trusted_device?
        # Device is trusted - skip 2FA
        sign_in(resource_name, resource)
        set_flash_message!(:notice, :signed_in)
        respond_with resource, location: after_sign_in_path_for(resource)
      else
        # 2FA required - store user ID and redirect to 2FA page
        # Note: We don't sign in yet, just store ID for verification
        session[:otp_user_id] = resource.id
        redirect_to user_two_factor_authentication_path
      end
    else
      # No 2FA - regular login
      sign_in(resource_name, resource)
      set_flash_message!(:notice, :signed_in)
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  private

  def trusted_device?
    return false unless cookies.encrypted[:trusted_device_token].present?

    token = cookies.encrypted[:trusted_device_token]
    # Token format: "user_id:timestamp:random"
    user_id, timestamp, _ = token.split(':')

    # Check if token is for this user and not expired (30 days)
    user_id.to_i == resource.id && timestamp.to_i > 30.days.ago.to_i
  end
end
