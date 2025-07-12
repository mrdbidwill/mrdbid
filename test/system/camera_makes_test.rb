require "application_system_test_case"

class CameraMakesTest < ApplicationSystemTestCase
  setup do
    @camera_make = camera_makes(:one)
  end

  test "visiting the index" do
    visit camera_makes_url
    assert_selector "h1", text: "Camera makes"
  end

  test "should create camera make" do
    visit camera_makes_url
    click_on "New camera make"

    fill_in "Comments", with: @camera_make.comments
    fill_in "Description", with: @camera_make.description
    fill_in "Name", with: @camera_make.name
    click_on "Create Camera make"

    assert_text "Camera make was successfully created"
    click_on "Back"
  end

  test "should update Camera make" do
    visit camera_make_url(@camera_make)
    click_on "Edit this camera make", match: :first

    fill_in "Comments", with: @camera_make.comments
    fill_in "Description", with: @camera_make.description
    fill_in "Name", with: @camera_make.name
    click_on "Update Camera make"

    assert_text "Camera make was successfully updated"
    click_on "Back"
  end

  test "should destroy Camera make" do
    visit camera_make_url(@camera_make)
    accept_confirm { click_on "Destroy this camera make", match: :first }

    assert_text "Camera make was successfully destroyed"
  end
end
