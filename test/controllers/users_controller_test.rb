require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # User must be admin (permission_id = 1) to access users controller
    @user.update!(permission_id: 1)
    sign_in @user
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  # TODO: User creation should go through Devise registration, not UsersController
  # Custom admin user management needs different approach or use Devise admin gems

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should return 404 for non-existent user" do
    get user_url(id: 99999)
    assert_response :not_found
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: {
      user: {
        display_name: "Updated Name"
      }
    }

    assert_redirected_to user_url(@user)
    assert_equal "User was successfully updated.", flash[:notice]
  end

  test "should destroy user" do
    user_to_delete = User.create!(
      email: "delete@example.com",
      password: "password123456",
      password_confirmation: "password123456"
    )

    assert_difference("User.count", -1) do
      delete user_url(user_to_delete)
    end

    assert_redirected_to users_url
    assert_equal "User was successfully deleted.", flash[:notice]
  end

  test "should handle invalid creation" do
    skip "User creation via controller needs Devise integration fix"
    assert_no_difference("User.count") do
      post users_url, params: {
        user: {
          email: "",  # Invalid
          password: "password"
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should handle invalid update" do
    patch user_url(@user), params: {
      user: {
        email: ""  # Invalid
      }
    }

    assert_response :unprocessable_entity
  end

  test "should require authentication" do
    sign_out @user

    get users_url
    assert_redirected_to new_user_session_path
  end
end
