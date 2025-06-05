require "test_helper"

class StemTexturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stem_texture = stem_textures(:one)
  end

  test "should get index" do
    get stem_textures_url
    assert_response :success
  end

  test "should get new" do
    get new_stem_texture_url
    assert_response :success
  end

  test "should create stem_texture" do
    assert_difference("StemTexture.count") do
      post stem_textures_url, params: { stem_texture: { comments: @stem_texture.comments, description: @stem_texture.description, entered_by_id: @stem_texture.entered_by_id, name: @stem_texture.name, source_id: @stem_texture.source_id } }
    end

    assert_redirected_to stem_texture_url(StemTexture.last)
  end

  test "should show stem_texture" do
    get stem_texture_url(@stem_texture)
    assert_response :success
  end

  test "should get edit" do
    get edit_stem_texture_url(@stem_texture)
    assert_response :success
  end

  test "should update stem_texture" do
    patch stem_texture_url(@stem_texture), params: { stem_texture: { comments: @stem_texture.comments, description: @stem_texture.description, entered_by_id: @stem_texture.entered_by_id, name: @stem_texture.name, source_id: @stem_texture.source_id } }
    assert_redirected_to stem_texture_url(@stem_texture)
  end

  test "should destroy stem_texture" do
    assert_difference("StemTexture.count", -1) do
      delete stem_texture_url(@stem_texture)
    end

    assert_redirected_to stem_textures_url
  end
end
