require "test_helper"

class SourceDataTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_source_data_type = data_source_data_types(:one)
  end

  test "should get index" do
    get data_source_data_types_url
    assert_response :success
  end

  test "should get new" do
    get new_data_source_data_type_url
    assert_response :success
  end

  test "should create data_source_data_type" do
    assert_difference("DataSourceDataType.count") do
      post data_source_data_types_url, params: { data_source_data_type: { comments: @data_source_data_type.comments, description: @data_source_data_type.description, entered_by_id: @data_source_data_type.entered_by_id, name: @data_source_data_type.name, source_id: @data_source_data_type.source_id } }
    end

    assert_redirected_to data_source_data_type_url(DataSourceDataType.last)
  end

  test "should show data_source_data_type" do
    get data_source_data_type_url(@data_source_data_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_source_data_type_url(@data_source_data_type)
    assert_response :success
  end

  test "should update data_source_data_type" do
    patch data_source_data_type_url(@data_source_data_type), params: { data_source_data_type: { comments: @data_source_data_type.comments, description: @data_source_data_type.description, entered_by_id: @data_source_data_type.entered_by_id, name: @data_source_data_type.name, source_id: @data_source_data_type.source_id } }
    assert_redirected_to data_source_data_type_url(@data_source_data_type)
  end

  test "should destroy data_source_data_type" do
    assert_difference("DataSourceDataType.count", -1) do
      delete data_source_data_type_url(@data_source_data_type)
    end

    assert_redirected_to data_source_data_types_url
  end
end
