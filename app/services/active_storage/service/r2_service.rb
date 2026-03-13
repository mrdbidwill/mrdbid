# frozen_string_literal: true

require "active_storage/service/s3_service"

module ActiveStorage
  class Service::R2Service < Service::S3Service
    def public_url(key, **options)
      base = Rails.application.config.x.r2_public_base_url.to_s.strip
      return super if base.empty?

      "#{base.chomp("/")}/#{key}"
    end
  end
end
