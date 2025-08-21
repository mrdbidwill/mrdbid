# app/controllers/admin/application_controller.rb
class Admin::ApplicationController < ApplicationController
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit_verification?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit_verification?

  rescue_from Pundit::NotAuthorizedError do
    redirect_to(root_path, alert: "You are not authorized to perform this action.")
  end

  private

  def skip_pundit_verification?
    respond_to?(:devise_controller?) && devise_controller?
  end
end
