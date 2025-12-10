# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :check_honeypot, only: [:create]

  # Override update to add debugging
  def update
    Rails.logger.info "=" * 80
    Rails.logger.info "Account update params: #{params[:user]&.keys}"
    Rails.logger.info "Default country ID: #{params[:user]&.[](:default_country_id)}"
    Rails.logger.info "Default state ID: #{params[:user]&.[](:default_state_id)}"
    Rails.logger.info "Default city: #{params[:user]&.[](:default_city)}"
    Rails.logger.info "Default county: #{params[:user]&.[](:default_county)}"
    Rails.logger.info "=" * 80
    super
  end

  # Allow updating without password if only updating non-sensitive fields
  def update_resource(resource, params)
    # If user is only updating location preferences (not email or password), skip password requirement
    if params[:password].blank? && params[:email] == resource.email
      resource.update_without_password(params.except(:current_password))
    else
      resource.update_with_password(params)
    end
  end

  # Override destroy to handle strict_loading
  def destroy
    resource.strict_loading!(false)
    super
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:display_name, :default_country_id, :default_state_id, :default_city, :default_county])
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