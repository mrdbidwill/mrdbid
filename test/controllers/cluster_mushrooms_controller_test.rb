require "test_helper"

class ClusterMushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cluster_mushroom = cluster_mushrooms(:one)
  end

  test "should get index" do
    get cluster_mushrooms_path
    assert_response :success
  end

  test "should get new" do
    get '/cluster_mushrooms/new'
    assert_response :success
  end

  test "should create Cluster Mushroom" do
    assert_difference("ClusterMushroom.count", 1) do
      post cluster_mushrooms_path, params: {
        cluster_mushroom: {
          cluster_id: "777",
          mushroom_id: "888"
        }
      }
    end
    assert_redirected_to cluster_mushroom_path(ClusterMushroom.last)
  end

  test "should show cluster_mushroom" do
    get cluster_mushroom_path(@cluster_mushroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_cluster_mushroom_path(@cluster_mushroom)
    assert_response :success
  end

  test "should update cluster mushroom" do
    patch cluster_mushroom_path(@cluster_mushroom), params: {
      cluster_mushroom: {
        cluster_id: "3746",
        mushroom_id: "4567"
      }
    }
    assert_redirected_to cluster_mushroom_path(@cluster_mushroom)
  end


  test "should destroy cluster_mushroom" do
    assert_difference("ClusterMushroom.count", -1) do
      delete cluster_mushroom_path(@cluster_mushroom)
    end

    assert_redirected_to cluster_mushrooms_path
  end
end


