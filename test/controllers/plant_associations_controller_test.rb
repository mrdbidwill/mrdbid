require "test_helper"

class PlantAssociationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plant_associations_index_url
    assert_response :success
  end

  test "should get show" do
    get plant_associations_show_url
    assert_response :success
  end

  test "should get new" do
    get plant_associations_new_url
    assert_response :success
  end

  test "should get create" do
    get plant_associations_create_url
    assert_response :success
  end

  test "should get edit" do
    get plant_associations_edit_url
    assert_response :success
  end

  test "should get update" do
    get plant_associations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get plant_associations_destroy_url
    assert_response :success
  end
end
