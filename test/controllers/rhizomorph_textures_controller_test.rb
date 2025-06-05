require "test_helper"

class RhizomorphTexturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rhizomorph_texture = rhizomorph_textures(:one)
  end

  test "should get index" do
    get rhizomorph_textures_url
    assert_response :success
  end

  test "should get new" do
    get new_rhizomorph_texture_url
    assert_response :success
  end

  test "should create rhizomorph_texture" do
    assert_difference("RhizomorphTexture.count") do
      post rhizomorph_textures_url, params: { rhizomorph_texture: { comments: @rhizomorph_texture.comments, description: @rhizomorph_texture.description, entered_by_id: @rhizomorph_texture.entered_by_id, name: @rhizomorph_texture.name, source_id: @rhizomorph_texture.source_id } }
    end

    assert_redirected_to rhizomorph_texture_url(RhizomorphTexture.last)
  end

  test "should show rhizomorph_texture" do
    get rhizomorph_texture_url(@rhizomorph_texture)
    assert_response :success
  end

  test "should get edit" do
    get edit_rhizomorph_texture_url(@rhizomorph_texture)
    assert_response :success
  end

  test "should update rhizomorph_texture" do
    patch rhizomorph_texture_url(@rhizomorph_texture), params: { rhizomorph_texture: { comments: @rhizomorph_texture.comments, description: @rhizomorph_texture.description, entered_by_id: @rhizomorph_texture.entered_by_id, name: @rhizomorph_texture.name, source_id: @rhizomorph_texture.source_id } }
    assert_redirected_to rhizomorph_texture_url(@rhizomorph_texture)
  end

  test "should destroy rhizomorph_texture" do
    assert_difference("RhizomorphTexture.count", -1) do
      delete rhizomorph_texture_url(@rhizomorph_texture)
    end

    assert_redirected_to rhizomorph_textures_url
  end
end
