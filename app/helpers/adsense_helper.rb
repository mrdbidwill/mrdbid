# frozen_string_literal: true

module AdsenseHelper
  DEFAULT_ADSENSE_CLIENT_ID = "ca-pub-8323362126637830"

  def adsense_enabled?
    ENV["ADSENSE_ENABLED"].to_s == "true"
  end

  def adsense_client_id
    ENV["ADSENSE_CLIENT_ID"].presence || DEFAULT_ADSENSE_CLIENT_ID
  end

  def adsense_slot_id
    ENV["ADSENSE_SLOT_ID"].to_s.strip.presence
  end

  def render_adsense_script?
    adsense_enabled? && !user_signed_in?
  end

  def render_adsense_slot?
    render_adsense_script? && adsense_slot_id.present?
  end
end
