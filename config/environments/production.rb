# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot for better performance and memory savings (ignored by Rake tasks).
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Turn on fragment caching in view templates.
  config.action_controller.perform_caching = true

  # Cache assets for far-future expiry since they are all digest stamped.
  config.public_file_server.headers = { 'cache-control' => "public, max-age=#{1.year.to_i}" }

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Assume all access to the app is happening through a SSL-terminating reverse proxy.
  config.assume_ssl = true

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Skip http-to-https redirect for the default health check endpoint.
  # config.ssl_options = { redirect: { exclude: ->(request) { request.path == "/up" } } }

  # Log to STDOUT with the current request id as a default log tag.
  config.log_tags = [:request_id]
  config.logger   = ActiveSupport::TaggedLogging.logger($stdout)

  # Change to "debug" to log everything (including potentially personally-identifiable information!)
  config.log_level = ENV.fetch('RAILS_LOG_LEVEL', 'info')

  # Prevent health checks from clogging up the logs.
  config.silence_healthcheck_path = '/up'

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Replace the default in-process memory cache store with a durable alternative.
  config.cache_store = :solid_cache_store

  # Replace the default in-process and non-durable queuing backend for Active Job.
  config.active_job.queue_adapter = :solid_queue
  config.solid_queue.connects_to = { database: { writing: :queue } }

  config.action_mailer.default_url_options = { host: ENV.fetch("APP_HOST", "mrbid.com"), protocol: "https" }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              Rails.application.credentials.dig(:smtp, :address) || "localhost",
    port:                 Rails.application.credentials.dig(:smtp, :port) || 25,
    user_name:            Rails.application.credentials.dig(:smtp, :user_name),
    password:             Rails.application.credentials.dig(:smtp, :password),
    authentication:       Rails.application.credentials.dig(:smtp, :authentication) || "login",
    enable_starttls_auto: Rails.application.credentials.dig(:smtp, :enable_starttls_auto) != false
  }
  config.action_mailer.default_options = {
    from: Rails.application.credentials.dig(:smtp, :from) || "no-reply@mrbid.com"
  }
  config.action_mailer.default_url_options = { host: ENV["APP_HOST"] || "mrbid.com", protocol: "https" }


  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Only use :id for inspections in production.
  config.active_record.attributes_for_inspect = [:id]

  # Enable DNS rebinding protection and other `Host` header attacks.
  config.hosts = [
    "mrbid.com",           # Production domain
    "www.mrbid.com",       # WWW subdomain
    /.*\.mrbid\.com/,      # All subdomains
    "localhost"            # For health checks
  ]

  # Skip DNS rebinding protection for the default health check endpoint.
  config.host_authorization = { exclude: ->(request) { request.path == "/up" } }

   # Ensure assets are handled by Rails
   config.assets.css_compressor = nil # Tailwind doesn't need CSS compression
   config.assets.compile = true
   config.assets.digest = true
   config.assets.debug = false
end