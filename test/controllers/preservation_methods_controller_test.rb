require "test_helper"

class PreservationMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preservation_method = preservation_methods(:one)
  end

  test "should get index" do
    get preservation_methods_url
    assert_response :success
  end

  test "should get new" do
    get new_preservation_method_url
    assert_response :success
  end

  test "should create preservation_method" do
    assert_difference("PreservationMethod.count") do
      post preservation_methods_url, params: { preservation_method: { comments: @preservation_method.comments, description: @preservation_method.description, entered_by_id: @preservation_method.entered_by_id, name: @preservation_method.name, source_id: @preservation_method.source_id } }
    end

    assert_redirected_to preservation_method_url(PreservationMethod.last)
  end

  test "should show preservation_method" do
    get preservation_method_url(@preservation_method)
    assert_response :success
  end

  test "should get edit" do
    get edit_preservation_method_url(@preservation_method)
    assert_response :success
  end

  test "should update preservation_method" do
    patch preservation_method_url(@preservation_method), params: { preservation_method: { comments: @preservation_method.comments, description: @preservation_method.description, entered_by_id: @preservation_method.entered_by_id, name: @preservation_method.name, source_id: @preservation_method.source_id } }
    assert_redirected_to preservation_method_url(@preservation_method)
  end

  test "should destroy preservation_method" do
    assert_difference("PreservationMethod.count", -1) do
      delete preservation_method_url(@preservation_method)
    end

    assert_redirected_to preservation_methods_url
  end
end
