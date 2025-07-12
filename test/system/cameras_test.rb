require "application_system_test_case"

class CamerasTest < ApplicationSystemTestCase
  setup do
    @camera = cameras(:one)
  end

  test "visiting the index" do
    visit cameras_url
    assert_selector "h1", text: "Cameras"
  end

  test "should create camera" do
    visit cameras_url
    click_on "New camera"

    fill_in "Camera make", with: @camera.camera_make_id
    fill_in "Camera model", with: @camera.camera_model_id
    fill_in "Comments", with: @camera.comments
    fill_in "Description", with: @camera.description
    fill_in "Name", with: @camera.name
    click_on "Create Camera"

    assert_text "Camera was successfully created"
    click_on "Back"
  end

  test "should update Camera" do
    visit camera_url(@camera)
    click_on "Edit this camera", match: :first

    fill_in "Camera make", with: @camera.camera_make_id
    fill_in "Camera model", with: @camera.camera_model_id
    fill_in "Comments", with: @camera.comments
    fill_in "Description", with: @camera.description
    fill_in "Name", with: @camera.name
    click_on "Update Camera"

    assert_text "Camera was successfully updated"
    click_on "Back"
  end

  test "should destroy Camera" do
    visit camera_url(@camera)
    accept_confirm { click_on "Destroy this camera", match: :first }

    assert_text "Camera was successfully destroyed"
  end
end
