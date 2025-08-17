require "test_helper"

class DisplayOptionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one) # Reference your user fixture
    @species = species(:one) # Reference your species fixture
    sign_in @user # Devise helper to sign in the user
  end


  test "should get index" do
    get display_options_url
    assert_response :success
  end

  test "should get new" do
    get new_display_option_url
    assert_response :success
  end

  test "should create species" do
    assert_difference("DisplayOption.count") do
      post display_options_url, params: { species: { comments: @species.comments, description: @species.description, name: @species.name } }
    end

    assert_redirected_to display_option_url(DisplayOption.last)
  end

  test "should show species" do
    get display_option_url(@species)
    assert_response :success
  end

  test "should get edit" do
    get edit_display_option_url(@species)
    assert_response :success
  end

  test "should update species" do
    patch display_option_url(@species), params: { species: { comments: @species.comments, description: @species.description, name: @species.name } }
    assert_redirected_to display_option_url(@species)
  end

  test "should destroy species" do
    assert_difference("DisplayOption.count", -1) do
      delete display_option_url(@species)
    end

    assert_redirected_to display_options_url
  end
end
