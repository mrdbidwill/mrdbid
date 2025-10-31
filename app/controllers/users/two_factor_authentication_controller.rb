# app/controllers/users/two_factor_authentication_controller.rb
class Users::TwoFactorAuthenticationController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :require_otp_user_id

  def show
    # Show the OTP form
    @user = User.find(session[:otp_user_id])

    respond_to do |format|
      format.html
    end
  end

  def update
    @user = User.find(session[:otp_user_id])

    if @user.validate_and_consume_otp!(params[:otp_attempt])
      session.delete(:otp_user_id)
      sign_in(@user)
      redirect_to after_sign_in_path_for(@user), notice: 'Successfully signed in with 2FA'
    else
      flash.now[:alert] = 'Invalid OTP code. Please try again.'
      render :show
    end
  end

  private

  def require_otp_user_id
    unless session[:otp_user_id].present?
      redirect_to new_user_session_path, alert: 'Please log in first.'
    end
  end
end
