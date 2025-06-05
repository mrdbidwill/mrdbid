require "test_helper"

class OdorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @odor = odors(:one)
  end

  test "should get index" do
    get odors_url
    assert_response :success
  end

  test "should get new" do
    get new_odor_url
    assert_response :success
  end

  test "should create odor" do
    assert_difference("Odor.count") do
      post odors_url, params: { odor: { comments: @odor.comments, description: @odor.description, entered_by_id: @odor.entered_by_id, name: @odor.name, source_id: @odor.source_id } }
    end

    assert_redirected_to odor_url(Odor.last)
  end

  test "should show odor" do
    get odor_url(@odor)
    assert_response :success
  end

  test "should get edit" do
    get edit_odor_url(@odor)
    assert_response :success
  end

  test "should update odor" do
    patch odor_url(@odor), params: { odor: { comments: @odor.comments, description: @odor.description, entered_by_id: @odor.entered_by_id, name: @odor.name, source_id: @odor.source_id } }
    assert_redirected_to odor_url(@odor)
  end

  test "should destroy odor" do
    assert_difference("Odor.count", -1) do
      delete odor_url(@odor)
    end

    assert_redirected_to odors_url
  end
end
