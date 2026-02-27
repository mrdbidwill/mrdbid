class ToolsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, only: [:index], raise: false
  skip_after_action :verify_policy_scoped, only: [:index], raise: false

  def index
    # Tools landing page - shows all available utility tools
  end
end
