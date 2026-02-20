# frozen_string_literal: true

# Mycowriter configuration
Mycowriter.configure do |config|
  # Minimum number of characters required before autocomplete triggers
  # Default: 3
  config.min_characters = 3

  # Whether search should be case-sensitive
  # Default: false (case-insensitive)
  config.case_sensitive = false

  # Maximum number of results to return
  # Default: 20
  config.results_limit = 20
end

# Skip Pundit authorization and Devise authentication for Mycowriter engine controllers
# This ensures the autocomplete functionality works without requiring user authentication
Rails.application.config.to_prepare do
  Mycowriter::AutocompleteController.class_eval do
    skip_after_action :verify_authorized, raise: false
    skip_after_action :verify_policy_scoped, raise: false
    skip_before_action :authenticate_user!, raise: false if respond_to?(:authenticate_user!)
  end
end
