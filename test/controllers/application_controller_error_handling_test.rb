require "test_helper"

class ApplicationControllerErrorProbeController < ApplicationController
  layout false
  skip_before_action :authenticate_user!, raise: false
  skip_after_action :verify_authorized, raise: false
  skip_after_action :verify_policy_scoped, raise: false
  helper_method :root_path

  def ok
    render plain: "ok"
  end

  def root_path
    "/"
  end

  def forbidden
    raise Pundit::NotAuthorizedError, "forbidden"
  end

  def missing
    raise ActiveRecord::RecordNotFound, "missing"
  end

  def missing_file
    raise ActiveStorage::FileNotFoundError, "missing file"
  end

  def strict_loading
    raise ActiveRecord::StrictLoadingViolationError, "strict loading violation"
  end

  def boom
    raise StandardError, "boom"
  end

  def admin_gate
    require_admin!
    return if performed?

    render plain: "ok"
  end
end

class ApplicationControllerErrorHandlingTest < ActionDispatch::IntegrationTest
  test "unauthorized html GET redirects with alert" do
    with_error_probe_routes do
      get "/probe/forbidden"

      assert_redirected_to "/"
      assert_equal "You are not authorized to perform this action.", flash[:alert]
    end
  end

  test "unauthorized html non-GET uses see_other and referer" do
    with_error_probe_routes do
      patch "/probe/forbidden", headers: { "HTTP_REFERER" => "/probe/ok" }

      assert_response :see_other
      assert_equal "/probe/ok", URI.parse(response.location).path
      assert_equal "You are not authorized to perform this action.", flash[:alert]
    end
  end

  test "unauthorized json response returns forbidden payload" do
    with_error_probe_routes do
      get "/probe/forbidden.json"

      assert_response :forbidden
      body = JSON.parse(response.body)
      assert_equal "forbidden", body["error"]
      assert_match(/not authorized/i, body["message"])
    end
  end

  test "unauthorized pdf response returns plain text" do
    with_error_probe_routes do
      get "/probe/forbidden.pdf"

      assert_response :forbidden
      assert_equal "text/plain", response.media_type
      assert_match(/not authorized/i, response.body)
    end
  end

  test "record not found html redirects with 404 status" do
    with_error_probe_routes do
      get "/probe/missing"

      assert_response :not_found
      assert_equal "/", URI.parse(response.location).path
      assert_equal "The record you were looking for could not be found.", flash[:alert]
    end
  end

  test "record not found json response returns not_found payload" do
    with_error_probe_routes do
      get "/probe/missing.json"

      assert_response :not_found
      body = JSON.parse(response.body)
      assert_equal "not_found", body["error"]
      assert_equal "Record not found", body["message"]
    end
  end

  test "missing file html redirects with 404 status" do
    with_error_probe_routes do
      get "/probe/missing_file"

      assert_response :not_found
      assert_equal "/", URI.parse(response.location).path
      assert_match(/file could not be found/i, flash[:alert])
    end
  end

  test "missing file json response returns file_not_found payload" do
    with_error_probe_routes do
      get "/probe/missing_file.json"

      assert_response :not_found
      body = JSON.parse(response.body)
      assert_equal "file_not_found", body["error"]
      assert_equal "File not found", body["message"]
    end
  end

  test "strict loading violation renders internal error page" do
    with_error_probe_routes do
      get "/probe/strict_loading"

      assert_response :internal_server_error
      assert_match(/database query error occurred/i, response.body)
    end
  end

  test "internal errors are re-raised in test environment" do
    with_error_probe_routes do
      error = assert_raises(StandardError) do
        get "/probe/boom"
      end

      assert_equal "boom", error.message
    end
  end

  test "strict loading error shows admin details for elevated admin users" do
    with_error_probe_routes do
      sign_in users(:one)

      get "/probe/strict_loading"

      assert_response :internal_server_error
      assert_match(/Admin Error Details/i, response.body)
    end
  end

  test "require_admin redirects non-owner users" do
    with_error_probe_routes do
      sign_in users(:two)

      get "/probe/admin_gate"

      assert_redirected_to "/"
      assert_equal "Admin access required.", flash[:alert]
    end
  end

  test "require_admin allows owner users" do
    with_error_probe_routes do
      sign_in users(:one)

      get "/probe/admin_gate"

      assert_response :success
      assert_equal "ok", response.body
    end
  end

  test "expired temporary admin is downgraded and signed out" do
    with_error_probe_routes do
      user = users(:three)
      user.update!(
        permission_id: 2,
        temporary_admin: true,
        admin_expires_at: 1.hour.ago
      )
      sign_in user

      get "/probe/ok"

      assert_redirected_to "/"
      assert_match(/temporary admin access has expired/i, flash[:alert])

      user.reload
      assert_equal 9, user.permission_id
      assert_not user.temporary_admin?
      assert_nil user.admin_expires_at
    end
  end

  test "active temporary admin is not downgraded" do
    with_error_probe_routes do
      user = users(:three)
      user.update!(
        permission_id: 2,
        temporary_admin: true,
        admin_expires_at: 1.hour.from_now
      )
      sign_in user

      get "/probe/ok"

      assert_response :success
      assert_equal "ok", response.body

      user.reload
      assert_equal 2, user.permission_id
      assert user.temporary_admin?
    end
  end

  private

  def with_error_probe_routes
    with_routing do |set|
      set.draw do
        root "application_controller_error_probe#ok"
        get "/probe/ok", to: "application_controller_error_probe#ok"
        match "/probe/forbidden", to: "application_controller_error_probe#forbidden", via: [:get, :patch]
        get "/probe/missing", to: "application_controller_error_probe#missing"
        get "/probe/missing_file", to: "application_controller_error_probe#missing_file"
        get "/probe/strict_loading", to: "application_controller_error_probe#strict_loading"
        get "/probe/boom", to: "application_controller_error_probe#boom"
        get "/probe/admin_gate", to: "application_controller_error_probe#admin_gate"
      end

      yield
    end
  end
end
