# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  # Customize the actions as needed. For example:
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource.otp_required_for_login
      # Check if this device is trusted
      if trusted_device_valid?(resource)
        # Skip 2FA and sign in directly
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        redirect_to after_sign_in_path_for(resource)
      else
        # Redirect user to OTP flow if enabled
        session[:otp_user_id] = resource.id
        redirect_to user_two_factor_authentication_path
      end
    else
      # Default behavior - sign in and redirect
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      redirect_to after_sign_in_path_for(resource)
    end
  end

  private

  def trusted_device_valid?(user)
    return false unless cookies.encrypted[:trusted_device_token].present?

    device_token = cookies.encrypted[:trusted_device_token]
    fingerprint = device_fingerprint

    trusted_device = user.trusted_devices.active.find_by(
      device_token: device_token,
      device_fingerprint: fingerprint
    )

    if trusted_device&.active?
      true
    else
      # Clear invalid cookie
      cookies.delete(:trusted_device_token)
      false
    end
  end

  def device_fingerprint
    Digest::SHA256.hexdigest("#{request.user_agent}-#{request.remote_ip}")
  end
end
