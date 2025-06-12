require "test_helper"

class DisplayOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @display_option = display_options(:one)
  end

  test "should get index" do
    get display_options_url
    assert_response :success
  end

  test "should get new" do
    get new_display_option_url
    assert_response :success
  end

  test "should create display_option" do
    assert_difference("DisplayOption.count") do
      post display_options_url, params: { display_option: { comments: @display_option.comments, description: @display_option.description, entered_by_id: @display_option.entered_by_id, name: @display_option.name, source_id: @display_option.source_id } }
    end

    assert_redirected_to display_option_url(DisplayOption.last)
  end

  test "should show display_option" do
    get display_option_url(@display_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_display_option_url(@display_option)
    assert_response :success
  end

  test "should update display_option" do
    patch display_option_url(@display_option), params: { display_option: { comments: @display_option.comments, description: @display_option.description, entered_by_id: @display_option.entered_by_id, name: @display_option.name, source_id: @display_option.source_id } }
    assert_redirected_to display_option_url(@display_option)
  end

  test "should destroy display_option" do
    assert_difference("DisplayOption.count", -1) do
      delete display_option_url(@display_option)
    end

    assert_redirected_to display_options_url
  end
end
