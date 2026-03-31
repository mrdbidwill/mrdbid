# frozen_string_literal: true

module AnalyticsHelper
  def ga_measurement_id
    ENV["GA_MEASUREMENT_ID"].to_s.strip
  end

  def ga_enabled?
    ENV["GA_ENABLED"].to_s == "true" && ga_measurement_id.present?
  end

  def render_ga_script?
    return false unless ga_enabled?
    return false if user_signed_in?
    return false if controller_path.start_with?("admin/") || controller_path.start_with?("users/")

    true
  end
end
