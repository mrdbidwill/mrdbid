require "test_helper"

class ToxicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toxic = toxics(:one)
  end

  test "should get index" do
    get toxics_url
    assert_response :success
  end

  test "should get new" do
    get new_toxic_url
    assert_response :success
  end

  test "should create toxic" do
    assert_difference("Toxic.count") do
      post toxics_url, params: { toxic: { comments: @toxic.comments, description: @toxic.description, entered_by_id: @toxic.entered_by_id, name: @toxic.name, source_id: @toxic.source_id } }
    end

    assert_redirected_to toxic_url(Toxic.last)
  end

  test "should show toxic" do
    get toxic_url(@toxic)
    assert_response :success
  end

  test "should get edit" do
    get edit_toxic_url(@toxic)
    assert_response :success
  end

  test "should update toxic" do
    patch toxic_url(@toxic), params: { toxic: { comments: @toxic.comments, description: @toxic.description, entered_by_id: @toxic.entered_by_id, name: @toxic.name, source_id: @toxic.source_id } }
    assert_redirected_to toxic_url(@toxic)
  end

  test "should destroy toxic" do
    assert_difference("Toxic.count", -1) do
      delete toxic_url(@toxic)
    end

    assert_redirected_to toxics_url
  end
end
