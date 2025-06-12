require "test_helper"

class SpecimenAgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specimen_age = specimen_ages(:one)
  end

  test "should get index" do
    get specimen_ages_url
    assert_response :success
  end

  test "should get new" do
    get new_specimen_age_url
    assert_response :success
  end

  test "should create specimen_age" do
    assert_difference("SpecimenAge.count") do
      post specimen_ages_url, params: { specimen_age: { comments: @specimen_age.comments, description: @specimen_age.description, entered_by_id: @specimen_age.entered_by_id, name: @specimen_age.name, source_id: @specimen_age.source_id } }
    end

    assert_redirected_to specimen_age_url(SpecimenAge.last)
  end

  test "should show specimen_age" do
    get specimen_age_url(@specimen_age)
    assert_response :success
  end

  test "should get edit" do
    get edit_specimen_age_url(@specimen_age)
    assert_response :success
  end

  test "should update specimen_age" do
    patch specimen_age_url(@specimen_age), params: { specimen_age: { comments: @specimen_age.comments, description: @specimen_age.description, entered_by_id: @specimen_age.entered_by_id, name: @specimen_age.name, source_id: @specimen_age.source_id } }
    assert_redirected_to specimen_age_url(@specimen_age)
  end

  test "should destroy specimen_age" do
    assert_difference("SpecimenAge.count", -1) do
      delete specimen_age_url(@specimen_age)
    end

    assert_redirected_to specimen_ages_url
  end
end
