require "application_system_test_case"

class CameraModelsTest < ApplicationSystemTestCase
  setup do
    @camera_model = camera_models(:one)
  end

  test "visiting the index" do
    visit camera_models_url
    assert_selector "h1", text: "Camera models"
  end

  test "should create camera model" do
    visit camera_models_url
    click_on "New camera model"

    click_on "Create Camera model"

    assert_text "Camera model was successfully created"
    click_on "Back"
  end

  test "should update Camera model" do
    visit camera_model_url(@camera_model)
    click_on "Edit this camera model", match: :first

    click_on "Update Camera model"

    assert_text "Camera model was successfully updated"
    click_on "Back"
  end

  test "should destroy Camera model" do
    visit camera_model_url(@camera_model)
    accept_confirm { click_on "Destroy this camera model", match: :first }

    assert_text "Camera model was successfully destroyed"
  end
end
