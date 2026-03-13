# frozen_string_literal: true

require "test_helper"

class MushroomsPdfExportRequestTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @country = countries(:one)
    @fungus_type = fungus_types(:one)
  end

  test "export all pdf requires authentication" do
    get export_all_pdf_mushrooms_path(format: :pdf)
    assert_response :unauthorized
    assert_match(/sign in or sign up/i, response.body)
  end

  test "export all pdf redirects to background export for signed-in user" do
    sign_in @user

    Mushroom.create!(
      name: "PDF Export Mushroom",
      user: @user,
      country: @country,
      fungus_type: @fungus_type,
      collection_date: Date.today
    )

    get export_all_pdf_mushrooms_path(format: :pdf)
    assert_redirected_to new_users_pdf_export_path
  end
end
