require "test_helper"
require "uri"

class Users::PdfExportsControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  setup do
    @user = users(:one)
    @other_user = users(:two)
    @original_cache = Rails.cache
    Rails.cache = ActiveSupport::Cache::MemoryStore.new
    sign_in @user
  end

  teardown do
    Rails.cache = @original_cache
  end

  test "new redirects when user has no mushrooms" do
    sign_out @user
    user = User.create!(
      email: "no_mushrooms_#{SecureRandom.hex(4)}@example.com",
      password: "password",
      confirmed_at: Time.current,
      permission_id: 9
    )
    sign_in user

    get new_users_pdf_export_path
    assert_redirected_to mushrooms_path
  end

  test "create enqueues export and stores cache" do
    assert_enqueued_with(job: UserPdfExportJob) do
      post users_pdf_export_path
    end

    export_id = URI.parse(response.redirect_url).path.split("/")[-2]
    assert_redirected_to users_pdf_export_status_path(id: export_id)
    info = Rails.cache.read("pdf_export:#{export_id}")
    assert_equal "processing", info[:status]
  end

  test "create redirects to existing export when active" do
    Rails.cache.write(
      "pdf_export:active:#{@user.id}",
      { export_id: "existing", created_at: Time.current },
      expires_in: 30.minutes
    )

    post users_pdf_export_path
    assert_redirected_to users_pdf_export_status_path(id: "existing")
  end

  test "status redirects when export belongs to another user" do
    Rails.cache.write(
      "pdf_export:other",
      { status: "processing", user_id: @other_user.id, created_at: Time.current },
      expires_in: 7.days
    )

    get users_pdf_export_status_path(id: "other")
    assert_redirected_to mushrooms_path
  end

  test "download redirects when export is not ready" do
    Rails.cache.write(
      "pdf_export:pending",
      { status: "processing", user_id: @user.id, created_at: Time.current },
      expires_in: 7.days
    )

    get users_pdf_export_download_path(id: "pending")
    assert_redirected_to users_pdf_export_status_path(id: "pending")
  end

  test "download redirects when file is missing" do
    Rails.cache.write(
      "pdf_export:ready_missing",
      { status: "ready", user_id: @user.id, filename: "missing.pdf", created_at: Time.current },
      expires_in: 7.days
    )

    get users_pdf_export_download_path(id: "ready_missing")
    assert_redirected_to users_pdf_export_status_path(id: "ready_missing")
  end
end
