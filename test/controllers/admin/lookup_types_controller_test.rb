require "test_helper"

class LookupTypesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one) # Reference your user fixture
    @lookup_type = lookup_types(:one) # Reference your lookup_type fixture
    sign_in @user # Devise helper to sign in the user
  end


  test "should get index" do
    get lookup_types_url
    assert_response :success
  end

  test "should get new" do
    get new_lookup_type_url
    assert_response :success
  end

  test "should create lookup_type" do
    assert_difference("LookupType.count") do
      post lookup_types_url, params: { lookup_type: { comments: @lookup_type.comments, description: @lookup_type.description, name: @lookup_type.name } }
    end

    assert_redirected_to lookup_type_url(LookupType.last)
  end

  test "should show lookup_type" do
    get lookup_type_url(@lookup_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_lookup_type_url(@lookup_type)
    assert_response :success
  end

  test "should update lookup_type" do
    patch lookup_type_url(@lookup_type), params: { lookup_type: { comments: @lookup_type.comments, description: @lookup_type.description, name: @lookup_type.name } }
    assert_redirected_to lookup_type_url(@lookup_type)
  end

  test "should destroy lookup_type" do
    assert_difference("LookupType.count", -1) do
      delete lookup_type_url(@lookup_type)
    end

    assert_redirected_to lookup_types_url
  end
end
