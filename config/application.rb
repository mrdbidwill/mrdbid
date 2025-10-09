# config/application.rb
# frozen_string_literal: true


require_relative 'boot'

require 'rails/all'
require 'rails/application_controller' # Fix for Rails::ApplicationController error
require 'i18n'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mrdbid
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # In local development/test (outside Docker), ignore DATABASE_URL so it doesn't override database.yml
    config.before_configuration do
      if (Rails.env.development? || Rails.env.test?) && !File.exist?("/.dockerenv")
        ENV.delete("DATABASE_URL")
        ENV["DB_HOST"] ||= "127.0.0.1"
      end
    end

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # Force Rails to use structure.sql instead of schema.rb
    config.active_record.schema_format = :sql
    # Force Rails to raise errors on unknown database attributes
    config.active_record.strict_loading_by_default = true

    # Enable built-in I18n fallbacks
    config.i18n.fallbacks = true

  end
end
