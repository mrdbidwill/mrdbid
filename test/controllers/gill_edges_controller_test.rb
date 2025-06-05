require "test_helper"

class GillEdgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gill_edge = gill_edges(:one)
  end

  test "should get index" do
    get gill_edges_url
    assert_response :success
  end

  test "should get new" do
    get new_gill_edge_url
    assert_response :success
  end

  test "should create gill_edge" do
    assert_difference("GillEdge.count") do
      post gill_edges_url, params: { gill_edge: { description: @gill_edge.description, name: @gill_edge.name } }
    end

    assert_redirected_to gill_edge_url(GillEdge.last)
  end

  test "should show gill_edge" do
    get gill_edge_url(@gill_edge)
    assert_response :success
  end

  test "should get edit" do
    get edit_gill_edge_url(@gill_edge)
    assert_response :success
  end

  test "should update gill_edge" do
    patch gill_edge_url(@gill_edge), params: { gill_edge: { description: @gill_edge.description, name: @gill_edge.name } }
    assert_redirected_to gill_edge_url(@gill_edge)
  end

  test "should destroy gill_edge" do
    assert_difference("GillEdge.count", -1) do
      delete gill_edge_url(@gill_edge)
    end

    assert_redirected_to gill_edges_url
  end
end
