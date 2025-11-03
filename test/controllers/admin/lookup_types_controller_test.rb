require "test_helper"

class LookupTypesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one) # Reference your user fixture
    @user.permission_id = 2 # Set admin permission
    @lookup_type = lookup_types(:one) # Reference your lookup_type fixture
    sign_in @user # Devise helper to sign in the user
  end


  test "should get index" do
    get admin_lookup_types_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_lookup_type_url
    assert_response :success
  end

  test "should create lookup_type" do
    assert_difference("LookupType.count") do
      post admin_lookup_types_url, params: { lookup_type: { comments: "New comment", description: "New description", name: "New Lookup Type" } }
    end

    assert_redirected_to admin_lookup_type_url(LookupType.last)
  end

  test "should show lookup_type" do
    get admin_lookup_type_url(@lookup_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_lookup_type_url(@lookup_type)
    assert_response :success
  end

  test "should update lookup_type" do
    patch admin_lookup_type_url(@lookup_type), params: { lookup_type: { comments: @lookup_type.comments, description: @lookup_type.description, name: @lookup_type.name } }
    assert_redirected_to admin_lookup_type_url(@lookup_type)
  end

  test "should not destroy lookup_type with foreign key constraint" do
    # LookupTypes are referenced by MrCharacters, so deletion should fail
    assert_no_difference("LookupType.count") do
      assert_raises(ActiveRecord::InvalidForeignKey) do
        delete admin_lookup_type_url(@lookup_type)
      end
    end
  end
end
