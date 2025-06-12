require "test_helper"

class CapSurfaceTexturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cap_surface_texture = cap_surface_textures(:one)
  end

  test "should get index" do
    get cap_surface_textures_url
    assert_response :success
  end

  test "should get new" do
    get new_cap_surface_texture_url
    assert_response :success
  end

  test "should create cap_surface_texture" do
    assert_difference("CapSurfaceTexture.count") do
      post cap_surface_textures_url, params: { cap_surface_texture: { comments: @cap_surface_texture.comments, description: @cap_surface_texture.description, entered_by_id: @cap_surface_texture.entered_by_id, name: @cap_surface_texture.name, source_id: @cap_surface_texture.source_id } }
    end

    assert_redirected_to cap_surface_texture_url(CapSurfaceTexture.last)
  end

  test "should show cap_surface_texture" do
    get cap_surface_texture_url(@cap_surface_texture)
    assert_response :success
  end

  test "should get edit" do
    get edit_cap_surface_texture_url(@cap_surface_texture)
    assert_response :success
  end

  test "should update cap_surface_texture" do
    patch cap_surface_texture_url(@cap_surface_texture), params: { cap_surface_texture: { comments: @cap_surface_texture.comments, description: @cap_surface_texture.description, entered_by_id: @cap_surface_texture.entered_by_id, name: @cap_surface_texture.name, source_id: @cap_surface_texture.source_id } }
    assert_redirected_to cap_surface_texture_url(@cap_surface_texture)
  end

  test "should destroy cap_surface_texture" do
    assert_difference("CapSurfaceTexture.count", -1) do
      delete cap_surface_texture_url(@cap_surface_texture)
    end

    assert_redirected_to cap_surface_textures_url
  end
end
