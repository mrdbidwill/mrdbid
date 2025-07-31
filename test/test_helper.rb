# test/test_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'devise'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Set up all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Include Devise test helpers
  include Devise::Test::IntegrationHelpers
end



class ActionDispatch::IntegrationTest
  # Sign in helper for integration tests
  def sign_in(user)
    post user_session_path, params: {
      user: {
        email: user.email,
        password: "password" # Ensure this matches the fixture's password
      }
    }
  end
end
