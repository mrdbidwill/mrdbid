require "test_helper"

class VeilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @veil = veils(:one)
  end

  test "should get index" do
    get veils_url
    assert_response :success
  end

  test "should get new" do
    get new_veil_url
    assert_response :success
  end

  test "should create veil" do
    assert_difference("Veil.count") do
      post veils_url, params: { veil: { comments: @veil.comments, description: @veil.description, entered_by_id: @veil.entered_by_id, name: @veil.name, source_id: @veil.source_id } }
    end

    assert_redirected_to veil_url(Veil.last)
  end

  test "should show veil" do
    get veil_url(@veil)
    assert_response :success
  end

  test "should get edit" do
    get edit_veil_url(@veil)
    assert_response :success
  end

  test "should update veil" do
    patch veil_url(@veil), params: { veil: { comments: @veil.comments, description: @veil.description, entered_by_id: @veil.entered_by_id, name: @veil.name, source_id: @veil.source_id } }
    assert_redirected_to veil_url(@veil)
  end

  test "should destroy veil" do
    assert_difference("Veil.count", -1) do
      delete veil_url(@veil)
    end

    assert_redirected_to veils_url
  end
end
