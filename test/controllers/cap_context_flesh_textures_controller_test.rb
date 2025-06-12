require "test_helper"

class CapContextFleshTexturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cap_context_flesh_texture = cap_context_flesh_textures(:one)
  end

  test "should get index" do
    get cap_context_flesh_textures_url
    assert_response :success
  end

  test "should get new" do
    get new_cap_context_flesh_texture_url
    assert_response :success
  end

  test "should create cap_context_flesh_texture" do
    assert_difference("CapContextFleshTexture.count") do
      post cap_context_flesh_textures_url, params: { cap_context_flesh_texture: { comments: @cap_context_flesh_texture.comments, description: @cap_context_flesh_texture.description, entered_by_id: @cap_context_flesh_texture.entered_by_id, name: @cap_context_flesh_texture.name, source_id: @cap_context_flesh_texture.source_id } }
    end

    assert_redirected_to cap_context_flesh_texture_url(CapContextFleshTexture.last)
  end

  test "should show cap_context_flesh_texture" do
    get cap_context_flesh_texture_url(@cap_context_flesh_texture)
    assert_response :success
  end

  test "should get edit" do
    get edit_cap_context_flesh_texture_url(@cap_context_flesh_texture)
    assert_response :success
  end

  test "should update cap_context_flesh_texture" do
    patch cap_context_flesh_texture_url(@cap_context_flesh_texture), params: { cap_context_flesh_texture: { comments: @cap_context_flesh_texture.comments, description: @cap_context_flesh_texture.description, entered_by_id: @cap_context_flesh_texture.entered_by_id, name: @cap_context_flesh_texture.name, source_id: @cap_context_flesh_texture.source_id } }
    assert_redirected_to cap_context_flesh_texture_url(@cap_context_flesh_texture)
  end

  test "should destroy cap_context_flesh_texture" do
    assert_difference("CapContextFleshTexture.count", -1) do
      delete cap_context_flesh_texture_url(@cap_context_flesh_texture)
    end

    assert_redirected_to cap_context_flesh_textures_url
  end
end
