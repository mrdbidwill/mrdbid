require "application_system_test_case"

class CameraMakesTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    Warden.test_mode!

    @camera_make = camera_makes(:one)

    @user = users(:one)
    login_as(@user, scope: :user)
  end

  teardown do
    Warden.test_reset!
  end


  test "visiting the index" do
    visit admin_camera_makes_url
    assert_selector "h1", text: "Camera makes"
  end

  test "should create camera make" do
    visit admin_camera_makes_url
    click_on "New camera make"

    # Fill fields only if your form requires them; name is validated
    fill_in "Name", with: "Created via system test"

    click_on "Create Camera Make"

    assert_text "Camera make was successfully created"
    click_on "Back to camera makes"
  end


  test "should update Camera make" do
    visit admin_camera_make_url(@camera_make)
    click_on "Edit this camera make", match: :first

    fill_in "Name", with: "Updated via system test"

    click_on "Update Camera Make"

    assert_text "Camera make was successfully updated"
    click_on "Back to camera makes"
  end


  test "should destroy Camera make" do
    visit admin_camera_make_url(@camera_make)
    accept_confirm { click_on "Delete this camera make", match: :first }

    assert_text "Camera make was successfully destroyed"
  end
end
