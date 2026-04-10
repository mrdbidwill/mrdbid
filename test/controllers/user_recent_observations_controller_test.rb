require "test_helper"

class UserRecentObservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @other_user = users(:two)
    sign_in @user

    @my_recent = UserRecentObservation.create!(
      user: @user,
      mushroom: mushrooms(:one),
      last_viewed_at: 2.minutes.ago,
      view_count: 3
    )
    @other_recent = UserRecentObservation.create!(
      user: @other_user,
      mushroom: mushrooms(:two),
      last_viewed_at: 1.minute.ago,
      view_count: 1
    )
  end

  test "reset clears only current user's recent observations" do
    delete reset_recent_observations_path

    assert_redirected_to mushrooms_path
    assert_equal "Recent observations were reset.", flash[:notice]
    assert_not UserRecentObservation.exists?(@my_recent.id)
    assert UserRecentObservation.exists?(@other_recent.id)
  end

  test "reset requires authentication" do
    sign_out @user

    delete reset_recent_observations_path

    assert_redirected_to new_user_session_path
  end
end
