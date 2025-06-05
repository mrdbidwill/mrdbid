require "test_helper"

class PartialInnerVeilTexturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partial_inner_veil_texture = partial_inner_veil_textures(:one)
  end

  test "should get index" do
    get partial_inner_veil_textures_url
    assert_response :success
  end

  test "should get new" do
    get new_partial_inner_veil_texture_url
    assert_response :success
  end

  test "should create partial_inner_veil_texture" do
    assert_difference("PartialInnerVeilTexture.count") do
      post partial_inner_veil_textures_url, params: { partial_inner_veil_texture: { comments: @partial_inner_veil_texture.comments, description: @partial_inner_veil_texture.description, entered_by_id: @partial_inner_veil_texture.entered_by_id, name: @partial_inner_veil_texture.name, source_id: @partial_inner_veil_texture.source_id } }
    end

    assert_redirected_to partial_inner_veil_texture_url(PartialInnerVeilTexture.last)
  end

  test "should show partial_inner_veil_texture" do
    get partial_inner_veil_texture_url(@partial_inner_veil_texture)
    assert_response :success
  end

  test "should get edit" do
    get edit_partial_inner_veil_texture_url(@partial_inner_veil_texture)
    assert_response :success
  end

  test "should update partial_inner_veil_texture" do
    patch partial_inner_veil_texture_url(@partial_inner_veil_texture), params: { partial_inner_veil_texture: { comments: @partial_inner_veil_texture.comments, description: @partial_inner_veil_texture.description, entered_by_id: @partial_inner_veil_texture.entered_by_id, name: @partial_inner_veil_texture.name, source_id: @partial_inner_veil_texture.source_id } }
    assert_redirected_to partial_inner_veil_texture_url(@partial_inner_veil_texture)
  end

  test "should destroy partial_inner_veil_texture" do
    assert_difference("PartialInnerVeilTexture.count", -1) do
      delete partial_inner_veil_texture_url(@partial_inner_veil_texture)
    end

    assert_redirected_to partial_inner_veil_textures_url
  end
end
