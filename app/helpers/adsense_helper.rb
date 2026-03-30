# frozen_string_literal: true

module AdsenseHelper
  def adsense_enabled?
    ENV["ADSENSE_ENABLED"].to_s == "true"
  end

  def render_adsense_script?
    adsense_enabled? && !user_signed_in?
  end
end
