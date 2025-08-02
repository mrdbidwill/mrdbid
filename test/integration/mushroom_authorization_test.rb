require "test_helper"

class MushroomAuthorizationTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)              # Simulated logged-in user (fixtures)
    @another_user = users(:two)      # Another user to test access restrictions
    @mushroom = mushrooms(:one)      # Belongs to @user
    @other_mushroom = mushrooms(:two) # Belongs to @another_user
  end

  test "authorized user sees their own actions" do
    # Simulate logging in as @user
    sign_in_as(@user)

    get mushrooms_path
    assert_response :success

    # Log the rendered HTML to inspect it
    # puts @response.body


    # Verify "Show" and "Edit" links for their own mushroom
    assert_select "a[href=?]", mushroom_path(@mushroom), text: "Show"                               # failing
    assert_select "a[href=?]", edit_mushroom_path(@mushroom), text: "Edit"

    # Ensure the unauthorized user's mushroom actions are not visible
    assert_select "a[href=?]", mushroom_path(@other_mushroom), text: "Show", count: 0
    assert_select "a[href=?]", edit_mushroom_path(@other_mushroom), text: "Edit", count: 0
  end

  test "unauthorized user does not see restricted links" do
    # Simulate another user logging in
    sign_in_as(@another_user)

    get mushrooms_path
    assert_response :success

    # Verify they cannot see "Show" or "Edit" for someone else's mushroom
    assert_select "a[href=?]", mushroom_path(@mushroom), text: "Show", count: 0
    assert_select "a[href=?]", edit_mushroom_path(@mushroom), text: "Edit", count: 0
  end

  test "guest user does not see protected links" do
    # Simulate a guest (not signed in)
    get mushrooms_path
    assert_response :success                                                                          # failing

    # Guests only see public content; ensure no "Show" or "Edit" links
    assert_select "a[href=?]", mushroom_path(@mushroom), text: "Show", count: 0
    assert_select "a[href=?]", edit_mushroom_path(@mushroom), text: "Edit", count: 0
    assert_select "a[href=?]", new_mushroom_path, count: 0
  end

  private

  # Updated sign_in method for Devise
  def sign_in_as(user)
    post new_user_session_path, params: { user: { email: user.email, password: "password" } }
    follow_redirect!
  end
end