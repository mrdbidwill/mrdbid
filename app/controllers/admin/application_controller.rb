# app/controllers/admin/application_controller.rb
class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  private

  def authorize_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "You are not authorized to access this area."
    end
  end
end