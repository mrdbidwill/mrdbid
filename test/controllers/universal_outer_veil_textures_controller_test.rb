require "test_helper"

class UniversalOuterVeilTexturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @universal_outer_veil_texture = universal_outer_veil_textures(:one)
  end

  test "should get index" do
    get universal_outer_veil_textures_url
    assert_response :success
  end

  test "should get new" do
    get new_universal_outer_veil_texture_url
    assert_response :success
  end

  test "should create universal_outer_veil_texture" do
    assert_difference("UniversalOuterVeilTexture.count") do
      post universal_outer_veil_textures_url, params: { universal_outer_veil_texture: { comments: @universal_outer_veil_texture.comments, description: @universal_outer_veil_texture.description, entered_by_id: @universal_outer_veil_texture.entered_by_id, name: @universal_outer_veil_texture.name, source_id: @universal_outer_veil_texture.source_id } }
    end

    assert_redirected_to universal_outer_veil_texture_url(UniversalOuterVeilTexture.last)
  end

  test "should show universal_outer_veil_texture" do
    get universal_outer_veil_texture_url(@universal_outer_veil_texture)
    assert_response :success
  end

  test "should get edit" do
    get edit_universal_outer_veil_texture_url(@universal_outer_veil_texture)
    assert_response :success
  end

  test "should update universal_outer_veil_texture" do
    patch universal_outer_veil_texture_url(@universal_outer_veil_texture), params: { universal_outer_veil_texture: { comments: @universal_outer_veil_texture.comments, description: @universal_outer_veil_texture.description, entered_by_id: @universal_outer_veil_texture.entered_by_id, name: @universal_outer_veil_texture.name, source_id: @universal_outer_veil_texture.source_id } }
    assert_redirected_to universal_outer_veil_texture_url(@universal_outer_veil_texture)
  end

  test "should destroy universal_outer_veil_texture" do
    assert_difference("UniversalOuterVeilTexture.count", -1) do
      delete universal_outer_veil_texture_url(@universal_outer_veil_texture)
    end

    assert_redirected_to universal_outer_veil_textures_url
  end
end
