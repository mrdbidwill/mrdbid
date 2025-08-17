require "test_helper"

class GenusMushroomsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one) # Reference your user fixture
    @genus_mushroom = genus_mushrooms(:one) # Reference your genus_mushroom fixture
    sign_in @user # Devise helper to sign in the user
  end


  test "should get index" do
    get genus_mushrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_genus_mushroom_url
    assert_response :success
  end

  test "should create genus_mushroom" do
    assert_difference("GenusMushroom.count") do
      post genus_mushrooms_url, params: { genus_mushroom: { comments: @genus_mushroom.comments, description: @genus_mushroom.description, name: @genus_mushroom.name } }
    end

    assert_redirected_to genus_mushroom_url(GenusMushroom.last)
  end

  test "should show genus_mushroom" do
    get genus_mushroom_url(@genus_mushroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_genus_mushroom_url(@genus_mushroom)
    assert_response :success
  end

  test "should update genus_mushroom" do
    patch genus_mushroom_url(@genus_mushroom), params: { genus_mushroom: { comments: @genus_mushroom.comments, description: @genus_mushroom.description, name: @genus_mushroom.name } }
    assert_redirected_to genus_mushroom_url(@genus_mushroom)
  end

  test "should destroy genus_mushroom" do
    assert_difference("GenusMushroom.count", -1) do
      delete genus_mushroom_url(@genus_mushroom)
    end

    assert_redirected_to genus_mushrooms_url
  end
end
