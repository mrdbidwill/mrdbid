require "test_helper"

class ToolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index when logged in" do
    get tools_path
    assert_response :success
    assert_select "h1", /Tools.*Utilities/
  end

  test "should redirect to login when not logged in" do
    sign_out @user
    get tools_path
    assert_redirected_to new_user_session_path
  end

  test "index should show export tools" do
    get tools_path
    assert_response :success
    assert_match "Export All to PDF", response.body
    assert_select "#export-all-pdf-link"
  end

  test "index should show organization tools" do
    get tools_path
    assert_response :success
    assert_match "Organize Specimens", response.body
  end

  test "index should show iNaturalist link" do
    get tools_path
    assert_response :success
    assert_match "iNaturalist Observation Fields", response.body
  end
end
