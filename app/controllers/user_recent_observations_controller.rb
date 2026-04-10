# frozen_string_literal: true

class UserRecentObservationsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, raise: false

  def reset
    current_user.user_recent_observations.delete_all
    redirect_back fallback_location: mushrooms_path, notice: "Recent observations were reset."
  end
end
