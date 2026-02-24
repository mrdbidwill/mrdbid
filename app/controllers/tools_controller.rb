class ToolsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, only: [:index]
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    # Tools landing page - shows all available utility tools
  end
end
