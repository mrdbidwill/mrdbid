# test/test_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'devise'

class ActiveSupport::TestCase
  # Run tests in parallel with a reduced number of workers to avoid DRb connection issues
  parallelize(workers: 1)
  include Pundit::Authorization # Include Pundit explicitly in tests
  # Set up all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Include Devise test helpers
  include Devise::Test::IntegrationHelpers
end



class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Pundit::Authorization

  # Make Pundit's policy and policy_scope methods available to views in tests
  def policy(record)
    Pundit.policy(current_user, record)
  end

  def policy_scope(scope)
    Pundit.policy_scope(current_user, scope)
  end

  # You don't need to define sign_in as it's provided by Devise::Test::IntegrationHelpers
end
