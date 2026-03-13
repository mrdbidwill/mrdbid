# frozen_string_literal: true

require "test_helper"

class UsersPdfExportsRequestTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  setup do
    @user = users(:one)
    @country = countries(:one)
    @fungus_type = fungus_types(:one)
  end

  test "create requires authentication" do
    post users_pdf_export_path
    assert_response :redirect
  end

  test "create enqueues export job and redirects to status" do
    sign_in @user

    Mushroom.create!(
      name: "PDF Export Mushroom",
      user: @user,
      country: @country,
      fungus_type: @fungus_type,
      collection_date: Date.today
    )

    assert_enqueued_with(job: UserPdfExportJob) do
      post users_pdf_export_path
    end

    assert_response :redirect
    assert_match(/\/users\/pdf_export\/.+\/status/, response.headers["Location"])
  end

  test "status shows processing state" do
    sign_in @user

    export_id = SecureRandom.uuid
    original_cache = Rails.cache
    Rails.cache = ActiveSupport::Cache::MemoryStore.new
    Rails.cache.write(
      "pdf_export:#{export_id}",
      {
        status: 'processing',
        user_id: @user.id,
        created_at: Time.current
      },
      expires_in: 1.hour
    )

    get users_pdf_export_status_path(id: export_id)
    assert_response :success
    assert_match(/Processing Your PDF/, response.body)
  ensure
    Rails.cache = original_cache
  end
end
