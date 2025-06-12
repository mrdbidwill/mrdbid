require "test_helper"

class ClusterMushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cluster_mushroom = cluster_mushrooms(:one)
  end

  test "should get index" do
    get cluster_mushrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_cluster_mushroom_url
    assert_response :success
  end

  test "should create cluster_mushroom" do
    assert_difference("ClusterMushroom.count") do
      post cluster_mushrooms_url, params: { cluster_mushroom: { cluster_id_id: @cluster_mushroom.cluster_id_id, mushroom_id_id: @cluster_mushroom.mushroom_id_id } }
    end

    assert_redirected_to cluster_mushroom_url(ClusterMushroom.last)
  end

  test "should show cluster_mushroom" do
    get cluster_mushroom_url(@cluster_mushroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_cluster_mushroom_url(@cluster_mushroom)
    assert_response :success
  end

  test "should update cluster_mushroom" do
    patch cluster_mushroom_url(@cluster_mushroom), params: { cluster_mushroom: { cluster_id_id: @cluster_mushroom.cluster_id_id, mushroom_id_id: @cluster_mushroom.mushroom_id_id } }
    assert_redirected_to cluster_mushroom_url(@cluster_mushroom)
  end

  test "should destroy cluster_mushroom" do
    assert_difference("ClusterMushroom.count", -1) do
      delete cluster_mushroom_url(@cluster_mushroom)
    end

    assert_redirected_to cluster_mushrooms_url
  end
end
