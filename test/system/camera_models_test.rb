require "application_system_test_case"

class CameraModelsTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    Warden.test_mode!

    @camera_model = camera_models(:one)

    @user = users(:one)
    login_as(@user, scope: :user)
  end

  teardown do
    Warden.test_reset!
  end


  test "visiting the index" do
    visit admin_camera_models_url
    assert_selector "h1", text: "Camera models"
  end

  test "should create camera model" do
    visit admin_camera_models_url
    click_on "New camera model"

    # Fill fields only if your form requires them; name is validated
    fill_in "Name", with: "Created via system test"

    click_on "Create Camera Model"

    assert_text "Camera model was successfully created"
    click_on "Back to camera models"
  end


  test "should update camera model" do
    visit admin_camera_model_url(@camera_model)
    click_on "Edit this camera model", match: :first

    fill_in "Name", with: "Updated via system test"

    click_on "Update Camera Model"

    assert_text "Camera model was successfully updated"
    click_on "Back to camera models"
  end


  test "should destroy Camera model" do
    visit admin_camera_model_url(@camera_model)
    accept_confirm { click_on "Destroy this camera model", match: :first }

    assert_text "Camera model was successfully destroyed"
  end
end

