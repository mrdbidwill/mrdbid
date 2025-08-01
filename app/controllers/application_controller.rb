# Manages the ApplicationController
# frozen_string_literal: true

class ApplicationController < ActionController::Base

  include Pundit::Authorization # Updated inclusion for Pundit
  # Make Pundit's policy and policy_scope methods available to views
  helper_method :policy, :policy_scope

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper :all # This includes all helpers in view contexts

  # Ensure authentication for all controllers
  before_action :authenticate_user!

  # Configure permitted parameters for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:display_name])
  end

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
