# frozen_string_literal: true

# app/helpers/application_helper.rb
module ApplicationHelper
  # Include Pundit methods for use in views
  include Pundit::Authorization
end
