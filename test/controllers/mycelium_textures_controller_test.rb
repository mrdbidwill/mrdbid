require "test_helper"

class MyceliumTexturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mycelium_texture = mycelium_textures(:one)
  end

  test "should get index" do
    get mycelium_textures_url
    assert_response :success
  end

  test "should get new" do
    get new_mycelium_texture_url
    assert_response :success
  end

  test "should create mycelium_texture" do
    assert_difference("MyceliumTexture.count") do
      post mycelium_textures_url, params: { mycelium_texture: { comments: @mycelium_texture.comments, description: @mycelium_texture.description, entered_by_id: @mycelium_texture.entered_by_id, name: @mycelium_texture.name, source_id: @mycelium_texture.source_id } }
    end

    assert_redirected_to mycelium_texture_url(MyceliumTexture.last)
  end

  test "should show mycelium_texture" do
    get mycelium_texture_url(@mycelium_texture)
    assert_response :success
  end

  test "should get edit" do
    get edit_mycelium_texture_url(@mycelium_texture)
    assert_response :success
  end

  test "should update mycelium_texture" do
    patch mycelium_texture_url(@mycelium_texture), params: { mycelium_texture: { comments: @mycelium_texture.comments, description: @mycelium_texture.description, entered_by_id: @mycelium_texture.entered_by_id, name: @mycelium_texture.name, source_id: @mycelium_texture.source_id } }
    assert_redirected_to mycelium_texture_url(@mycelium_texture)
  end

  test "should destroy mycelium_texture" do
    assert_difference("MyceliumTexture.count", -1) do
      delete mycelium_texture_url(@mycelium_texture)
    end

    assert_redirected_to mycelium_textures_url
  end
end
