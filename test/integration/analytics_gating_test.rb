# frozen_string_literal: true

require "test_helper"

class AnalyticsGatingTest < ActionDispatch::IntegrationTest
  setup do
    @original_enabled = ENV["GA_ENABLED"]
    @original_measurement_id = ENV["GA_MEASUREMENT_ID"]

    ENV["GA_ENABLED"] = "true"
    ENV["GA_MEASUREMENT_ID"] = "G-TEST1234"
  end

  teardown do
    ENV["GA_ENABLED"] = @original_enabled
    ENV["GA_MEASUREMENT_ID"] = @original_measurement_id
  end

  test "ga script is included for public pages when enabled with measurement id" do
    get root_path

    assert_response :success
    assert_includes response.body, "www.googletagmanager.com/gtag/js?id=G-TEST1234"
    assert_includes response.body, "gtag('config', 'G-TEST1234'"
  end

  test "ga script is excluded for authenticated users" do
    sign_in users(:one)
    get root_path

    assert_response :success
    assert_not_includes response.body, "www.googletagmanager.com/gtag/js"
  end

  test "ga script is excluded when measurement id is missing" do
    ENV["GA_MEASUREMENT_ID"] = ""
    get root_path

    assert_response :success
    assert_not_includes response.body, "www.googletagmanager.com/gtag/js"
  end

  test "ga script is excluded when disabled" do
    ENV["GA_ENABLED"] = "false"
    get root_path

    assert_response :success
    assert_not_includes response.body, "www.googletagmanager.com/gtag/js"
  end

  test "ga script is excluded for users controller pages" do
    get new_user_session_path

    assert_response :success
    assert_not_includes response.body, "www.googletagmanager.com/gtag/js"
  end
end
