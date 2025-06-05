require "test_helper"

class PlantAssociationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plant_association = plant_associations(:one)
  end

  test "should get index" do
    get plant_associations_url
    assert_response :success
  end

  test "should get new" do
    get new_plant_association_url
    assert_response :success
  end

  test "should create plant_association" do
    assert_difference("PlantAssociation.count") do
      post plant_associations_url, params: { plant_association: { comments: @plant_association.comments, description: @plant_association.description, entered_by_id: @plant_association.entered_by_id, name: @plant_association.name, source_id: @plant_association.source_id } }
    end

    assert_redirected_to plant_association_url(PlantAssociation.last)
  end

  test "should show plant_association" do
    get plant_association_url(@plant_association)
    assert_response :success
  end

  test "should get edit" do
    get edit_plant_association_url(@plant_association)
    assert_response :success
  end

  test "should update plant_association" do
    patch plant_association_url(@plant_association), params: { plant_association: { comments: @plant_association.comments, description: @plant_association.description, entered_by_id: @plant_association.entered_by_id, name: @plant_association.name, source_id: @plant_association.source_id } }
    assert_redirected_to plant_association_url(@plant_association)
  end

  test "should destroy plant_association" do
    assert_difference("PlantAssociation.count", -1) do
      delete plant_association_url(@plant_association)
    end

    assert_redirected_to plant_associations_url
  end
end
