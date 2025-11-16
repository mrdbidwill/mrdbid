# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  before_action :check_honeypot, only: [:create]

  # Override destroy to handle strict_loading
  def destroy
    resource.strict_loading!(false)
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:display_name])
  end

  private

  def check_honeypot
    # If the honeypot field is filled, it's likely a bot
    if params[:user][:website_url].present?
      Rails.logger.warn "Bot registration attempt detected: #{params[:user][:email]}"
      redirect_to new_user_registration_path, alert: "Registration failed. Please try again."
    end
  end
end