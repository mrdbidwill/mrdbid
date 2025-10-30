# app/controllers/users/two_factor_authentication_controller.rb
class Users::TwoFactorAuthenticationController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :load_user_from_session

  def show
    # Show the OTP form
    @user = User.find(session[:otp_user_id])
  end

  def update
    @user = User.find(session[:otp_user_id])
    otp_attempt = params[:otp_attempt]

    # Verify the OTP entered by the user
    if @user.validate_and_consume_otp!(otp_attempt)
      # Clean up the session
      session.delete(:otp_user_id)

      # If "trust device" is checked, set a cookie
      if params[:trust_device] == '1'
        set_trusted_device_cookie(@user)
      end

      # Sign in the user
      sign_in(@user)
      redirect_to root_path, notice: 'Successfully signed in with 2FA'
    else
      flash.now[:alert] = 'Invalid OTP code. Please try again.'
      render :show
    end
  end

  private

  def load_user_from_session
    unless session[:otp_user_id].present?
      redirect_to new_user_session_path, alert: 'Please log in first.'
    end
  end

  def set_trusted_device_cookie(user)
    # Create a unique token: user_id:timestamp:random
    token = "#{user.id}:#{Time.current.to_i}:#{SecureRandom.hex(32)}"

    # Set encrypted cookie that expires in 30 days
    cookies.encrypted[:trusted_device_token] = {
      value: token,
      expires: 30.days.from_now,
      httponly: true,
      secure: Rails.env.production?
    }
  end
end
