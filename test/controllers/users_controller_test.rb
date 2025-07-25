require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Define a valid user fixture or create a mock user in the database
    @user = User.create!(
      email: "existing_user@example.com",
      password: "password123",
      display_name: "Existing User"
    )
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      # Ensure valid user parameters are passed
      post users_url, params: {
        user: {
          email: "new_user@example.com",
          password: "password123",
          display_name: "New User"
        }
      }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: {
      user: {
        display_name: "Updated User"
      }
    }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end