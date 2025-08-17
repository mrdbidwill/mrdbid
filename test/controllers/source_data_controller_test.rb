require "test_helper"

class SourceDataControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one) # Reference your user fixture
    @source_data = source_data(:one) # Reference your source_data fixture
    sign_in @user # Devise helper to sign in the user
  end


  test "should get index" do
    get source_data_url
    assert_response :success
  end

  test "should get new" do
    get new_source_data_url
    assert_response :success
  end

  test "should create source_data" do
    assert_difference("SourceData.count") do
      post source_datas_url, params: { source_data: { comments: @source_data.comments, description: @source_data.description, name: @source_data.name } }
    end

    assert_redirected_to source_data_url(SourceData.last)
  end

  test "should show source_data" do
    get source_data_url(@source_data)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_data_url(@source_data)
    assert_response :success
  end

  test "should update source_data" do
    patch source_data_url(@source_data), params: { source_data: { comments: @source_data.comments, description: @source_data.description, name: @source_data.name } }
    assert_redirected_to source_data_url(@source_data)
  end

  test "should destroy source_data" do
    assert_difference("SourceData.count", -1) do
      delete source_data_url(@source_data)
    end

    assert_redirected_to source_data_url
  end
end
