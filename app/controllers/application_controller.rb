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

  # In development/test, ensure actions are authorized and index actions are policy-scoped.
  # Skips Devise controllers to avoid noise in auth flows.
  if Rails.env.development? || Rails.env.test?
    after_action :verify_authorized, except: [:index], unless: :devise_controller?
    after_action :verify_policy_scoped, only: [:index], unless: :devise_controller?
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:display_name])
  end

  private
  def user_not_authorized
    respond_to do |format|
      format.html do
        flash[:alert] = "You are not authorized to perform this action."
        # For non-GET requests, prefer 303 See Other to avoid form resubmission issues with Turbo.
        fallback = root_path
        if request.get?
          redirect_back fallback_location: fallback
        else
          redirect_to (request.referer || fallback), status: :see_other, allow_other_host: false
        end
      end

      format.json do
        render json: { error: "forbidden", message: "You are not authorized to perform this action." }, status: :forbidden
      end
    end
  end
end
