# app/controllers/users/two_factor_authentication_controller.rb
class Users::TwoFactorAuthenticationController < ApplicationController
  before_action :authenticate_user!

  def show
    # Show the OTP form if needed
    @user = current_user
  end

  def update
    # Verify the OTP entered by the user
    if current_user.validate_and_consume_otp!(params[:otp_attempt])
      session.delete(:otp_user_id) # Clean up the session after successful verification
      sign_in(current_user, bypass: true) # Sign in the user
      redirect_to root_path, notice: 'Successfully signed in with 2FA'
    else
      flash.now[:alert] = 'Invalid OTP code. Please try again.'
      render :show
    end
  end
end
