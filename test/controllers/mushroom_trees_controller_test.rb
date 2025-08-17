require "test_helper"

class MushroomTreeControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one) # Reference your user fixture
    @mushroom_tree = mushroom_trees(:one) # Reference your mushroom_tree fixture
    sign_in @user # Devise helper to sign in the user
  end


  test "should get index" do
    get mushroom_trees_url
    assert_response :success
  end

  test "should get new" do
    get new_mushroom_tree_url
    assert_response :success
  end

  test "should create mushroom_tree" do
    assert_difference("MushroomTree.count") do
      post mushroom_trees_url, params: { mushroom_tree: { comments: @mushroom_tree.comments, description: @mushroom_tree.description, name: @mushroom_tree.name } }
    end

    assert_redirected_to mushroom_tree_url(MushroomTree.last)
  end

  test "should show mushroom_tree" do
    get mushroom_tree_url(@mushroom_tree)
    assert_response :success
  end

  test "should get edit" do
    get edit_mushroom_tree_url(@mushroom_tree)
    assert_response :success
  end

  test "should update mushroom_tree" do
    patch mushroom_tree_url(@mushroom_tree), params: { mushroom_tree: { comments: @mushroom_tree.comments, description: @mushroom_tree.description, name: @mushroom_tree.name } }
    assert_redirected_to mushroom_tree_url(@mushroom_tree)
  end

  test "should destroy mushroom_tree" do
    assert_difference("MushroomTree.count", -1) do
      delete mushroom_tree_url(@mushroom_tree)
    end

    assert_redirected_to mushroom_tree_url
  end
end
