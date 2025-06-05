require "test_helper"

class GillBreadthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gill_breadth = gill_breadths(:one)
  end

  test "should get index" do
    get gill_breadths_url
    assert_response :success
  end

  test "should get new" do
    get new_gill_breadth_url
    assert_response :success
  end

  test "should create gill_breadth" do
    assert_difference("GillBreadth.count") do
      post gill_breadths_url, params: { gill_breadth: { comments: @gill_breadth.comments, description: @gill_breadth.description, entered_by_id: @gill_breadth.entered_by_id, name: @gill_breadth.name, source_id: @gill_breadth.source_id } }
    end

    assert_redirected_to gill_breadth_url(GillBreadth.last)
  end

  test "should show gill_breadth" do
    get gill_breadth_url(@gill_breadth)
    assert_response :success
  end

  test "should get edit" do
    get edit_gill_breadth_url(@gill_breadth)
    assert_response :success
  end

  test "should update gill_breadth" do
    patch gill_breadth_url(@gill_breadth), params: { gill_breadth: { comments: @gill_breadth.comments, description: @gill_breadth.description, entered_by_id: @gill_breadth.entered_by_id, name: @gill_breadth.name, source_id: @gill_breadth.source_id } }
    assert_redirected_to gill_breadth_url(@gill_breadth)
  end

  test "should destroy gill_breadth" do
    assert_difference("GillBreadth.count", -1) do
      delete gill_breadth_url(@gill_breadth)
    end

    assert_redirected_to gill_breadths_url
  end
end
