# app/controllers/admin/base_controller.rb
class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  # layout "admin" # Optional: custom layout for admin area


  private

  def authorize_admin!
    unless current_user&.admin? # Using admin? method defined in User model
      redirect_to root_path, alert: "You are not authorized to access this area."
    end
  end
end