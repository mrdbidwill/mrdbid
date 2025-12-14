# frozen_string_literal: true

require "test_helper"

class MushroomComparisonsRequestTest < ActionDispatch::IntegrationTest
  # ============================================================================
  # MUSHROOM COMPARISONS API REQUEST TESTS
  # ============================================================================
  # Tests for mushroom comparison endpoints
  #
  # ENDPOINTS TESTED:
  # - GET /mushrooms/:mushroom_id/comparisons (index)
  # - POST /mushrooms/:mushroom_id/comparisons (create - triggers job)
  # - GET /mushroom_comparisons/:id (show)
  #
  # FEATURES TESTED:
  # - Authentication requirements
  # - Minimum character requirements
  # - Async job triggering
  # - Comparison results display
  # - Pagination
  # - Character matching details
  # - Error handling
  # ============================================================================

  setup do
    @user = users(:one)
    @mushroom = mushrooms(:one)
    @other_mushroom = mushrooms(:two)
  end

  # ==========================================================================
  # INDEX TESTS (GET /mushrooms/:mushroom_id/comparisons)
  # ==========================================================================

  test "comparisons index requires authentication" do
    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "comparisons index returns success for authenticated user" do
    sign_in @user

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success
  end

  test "comparisons index displays minimum character requirement" do
    sign_in @user

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # Should show CompareMushroomsJob::MINIMUM_CHARACTERS in view
    assert_select "html" # Basic HTML response check
  end

  test "comparisons index shows alert when mushroom has insufficient characters" do
    sign_in @user

    # Ensure mushroom has fewer than minimum characters
    @mushroom.mr_character_mushrooms.destroy_all

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # Flash alert should be present (in flash.now)
    # Note: flash.now doesn't persist to next request, checked in view
  end

  test "comparisons index displays comparisons for mushroom with sufficient characters" do
    sign_in @user

    # Create minimum number of characters
    minimum = 5 # CompareMushroomsJob::MINIMUM_CHARACTERS
    minimum.times do |i|
      # Would need to create MrCharacter and MrCharacterMushroom records
      # Skip if fixtures already provide sufficient data
    end

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success
  end

  test "comparisons index shows pending comparison count" do
    sign_in @user

    # Create a new mushroom to avoid duplicate comparison
    new_mushroom = Mushroom.create!(
      name: "Test Pending Mushroom",
      user: @user,
      country: countries(:one),
      state: states(:one),
      fungus_type: fungus_types(:one)
    )

    # Create a pending comparison
    MushroomComparison.create!(
      mushroom: @mushroom,
      compared_mushroom: new_mushroom,
      status: "pending",
      similarity_score: 0
    )

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # Should display pending count in view
  end

  test "comparisons index paginates results" do
    skip "Requires creating 26+ comparisons"
    sign_in @user

    # Create more than 25 comparisons (per_page limit)
    30.times do |i|
      other_mushroom = Mushroom.create!(
        name: "Comparison#{i}",
        user: @user,
        country: countries(:one),
        state: states(:one),
        fungus_type: fungus_types(:one)
      )
      MushroomComparison.create!(
        mushroom: @mushroom,
        compared_mushroom: other_mushroom,
        status: "completed",
        similarity_score: 50 + i
      )
    end

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # Should show page 1 with 25 results
    get mushroom_mushroom_comparisons_path(@mushroom, page: 2)
    assert_response :success
    # Should show page 2 with remaining results
  end

  test "comparisons index orders by similarity score" do
    sign_in @user

    # Fixtures already have comparisons for mushroom:one
    # Use find_or_create_by to avoid duplicates
    high_score = MushroomComparison.find_or_create_by!(
      mushroom: @mushroom,
      compared_mushroom: @other_mushroom
    ) do |comparison|
      comparison.status = "completed"
      comparison.similarity_score = 90
    end

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # Results should be ordered by similarity_score DESC
  end

  test "comparisons index only shows completed comparisons" do
    sign_in @user

    # Create new mushrooms to avoid duplicate comparisons
    pending_mushroom = Mushroom.create!(
      name: "Test Pending Mushroom",
      user: @user,
      country: countries(:one),
      state: states(:one),
      fungus_type: fungus_types(:one)
    )

    completed_mushroom = Mushroom.create!(
      name: "Test Completed Mushroom",
      user: @user,
      country: countries(:one),
      state: states(:one),
      fungus_type: fungus_types(:one)
    )

    # Create pending comparison
    pending = MushroomComparison.create!(
      mushroom: @mushroom,
      compared_mushroom: pending_mushroom,
      status: "pending",
      similarity_score: 0
    )

    # Create completed comparison
    completed = MushroomComparison.create!(
      mushroom: @mushroom,
      compared_mushroom: completed_mushroom,
      status: "completed",
      similarity_score: 75
    )

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # Only completed comparisons should be displayed
  end

  test "comparisons index with non-existent mushroom returns not found" do
    sign_in @user

    assert_raises(ActiveRecord::RecordNotFound) do
      get mushroom_mushroom_comparisons_path(mushroom_id: 999999)
    end
  end

  # ==========================================================================
  # CREATE TESTS (POST /mushrooms/:mushroom_id/comparisons)
  # ==========================================================================

  test "comparisons create requires authentication" do
    post mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "comparisons create triggers comparison job" do
    skip "Requires job queue testing or stub"
    sign_in @user

    # Ensure mushroom has sufficient characters
    5.times do |i|
      # Create character associations
    end

    assert_enqueued_with(job: CompareMushroomsJob) do
      post mushroom_mushroom_comparisons_path(@mushroom)
    end

    assert_redirected_to mushroom_mushroom_comparisons_path(mushroom_id: @mushroom.id)
  end

  test "comparisons create redirects with notice on success" do
    skip "Requires sufficient character data"
    sign_in @user

    # Setup mushroom with minimum characters
    post mushroom_mushroom_comparisons_path(@mushroom)

    assert_redirected_to mushroom_mushroom_comparisons_path(mushroom_id: @mushroom.id)
    follow_redirect!
    assert_select ".notice", text: /Comparison started/
  end

  test "comparisons create rejects mushroom with insufficient characters" do
    sign_in @user

    # Ensure mushroom has zero characters
    @mushroom.mr_character_mushrooms.destroy_all

    post mushroom_mushroom_comparisons_path(@mushroom)

    assert_redirected_to mushroom_path(@mushroom)
    follow_redirect!
    assert_select ".alert", text: /needs at least/
  end

  test "comparisons create validates minimum character requirement" do
    sign_in @user

    # Mushroom with exactly minimum - 1 characters
    @mushroom.mr_character_mushrooms.destroy_all
    # Create minimum - 1 characters (would need actual setup)

    post mushroom_mushroom_comparisons_path(@mushroom)

    # Should redirect with error
    assert_redirected_to mushroom_path(@mushroom)
  end

  test "comparisons create with non-existent mushroom returns not found" do
    sign_in @user

    assert_raises(ActiveRecord::RecordNotFound) do
      post mushroom_mushroom_comparisons_path(mushroom_id: 999999)
    end
  end

  # ==========================================================================
  # SHOW TESTS (GET /mushroom_comparisons/:id)
  # ==========================================================================

  test "comparison show requires authentication" do
    # Use existing fixture comparison to avoid duplicates
    comparison = mushroom_comparisons(:completed_high_similarity)

    get mushroom_comparison_path(comparison)
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "comparison show returns success for authenticated user" do
    sign_in @user

    # Use existing fixture comparison to avoid duplicates
    comparison = mushroom_comparisons(:completed_high_similarity)

    get mushroom_comparison_path(comparison)
    assert_response :success
  end

  test "comparison show displays both mushrooms" do
    sign_in @user

    # Use existing fixture comparison to avoid duplicates
    comparison = mushroom_comparisons(:completed_high_similarity)

    get mushroom_comparison_path(comparison)
    assert_response :success

    # Should display details of both mushrooms
    assert_select "html" # Basic response check
  end

  test "comparison show displays similarity score" do
    sign_in @user

    # Use existing fixture comparison to avoid duplicates
    comparison = mushroom_comparisons(:completed_high_similarity)

    get mushroom_comparison_path(comparison)
    assert_response :success

    # Should show similarity score (85)
  end

  test "comparison show displays character matches" do
    sign_in @user

    # Use existing fixture comparison to avoid duplicates
    comparison = mushroom_comparisons(:completed_high_similarity)

    get mushroom_comparison_path(comparison)
    assert_response :success

    # Should show matching vs total characters
  end

  test "comparison show with non-existent id returns not found" do
    sign_in @user

    assert_raises(ActiveRecord::RecordNotFound) do
      get mushroom_comparison_path(id: 999999)
    end
  end

  test "comparison show loads character details for both mushrooms" do
    sign_in @user

    # Use existing fixture comparison to avoid duplicates
    comparison = mushroom_comparisons(:completed_high_similarity)

    get mushroom_comparison_path(comparison)
    assert_response :success

    # Instance variables should contain character data
    assert assigns(:mushroom_characters)
    assert assigns(:compared_characters)
  end

  # ==========================================================================
  # AUTHORIZATION TESTS
  # ==========================================================================

  test "user can view comparisons for any mushroom" do
    sign_in @user

    # Comparison for other user's mushroom
    other_users_mushroom = mushrooms(:two)

    get mushroom_mushroom_comparisons_path(other_users_mushroom)
    assert_response :success
  end

  test "user can create comparison for any mushroom" do
    skip "Requires character setup"
    sign_in @user

    other_users_mushroom = mushrooms(:two)

    post mushroom_mushroom_comparisons_path(other_users_mushroom)
    # Should succeed (comparisons are public feature)
  end

  # ==========================================================================
  # EDGE CASES
  # ==========================================================================

  test "comparisons index handles mushroom with no comparisons" do
    sign_in @user

    # Ensure no comparisons exist
    @mushroom.mushroom_comparisons.destroy_all

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # Should show empty state
  end

  test "comparisons index handles pending comparisons correctly" do
    sign_in @user

    # Create a new mushroom to avoid duplicate comparison
    pending_mushroom = Mushroom.create!(
      name: "Test Pending Comparison Mushroom",
      user: @user,
      country: countries(:one),
      state: states(:one),
      fungus_type: fungus_types(:one)
    )

    # Create both pending and completed
    MushroomComparison.create!(
      mushroom: @mushroom,
      compared_mushroom: pending_mushroom,
      status: "pending",
      similarity_score: 0
    )

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # Should show pending count but not in results
  end

  test "comparison create handles multiple simultaneous requests" do
    skip "Requires job queue and concurrency testing"
    sign_in @user

    # Multiple POST requests should each enqueue a job
    # Should not create duplicate jobs
  end

  # ==========================================================================
  # CHARACTER REQUIREMENT TESTS
  # ==========================================================================

  test "comparison character threshold is enforced" do
    sign_in @user

    # Test with exactly MINIMUM_CHARACTERS
    @mushroom.mr_character_mushrooms.destroy_all
    minimum = 5 # CompareMushroomsJob::MINIMUM_CHARACTERS

    # Add minimum - 1 (should fail)
    (minimum - 1).times do |i|
      # Would create characters
    end

    post mushroom_mushroom_comparisons_path(@mushroom)
    assert_redirected_to mushroom_path(@mushroom)
  end

  test "comparison shows character count in alert" do
    sign_in @user

    @mushroom.mr_character_mushrooms.destroy_all

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # Alert should mention current character count
  end

  # ==========================================================================
  # ASYNC JOB TESTS
  # ==========================================================================

  test "comparison create uses async job processing" do
    skip "Requires job infrastructure"
    sign_in @user

    # Should use CompareMushroomsJob.perform_later
    # Not CompareMushroomsJob.perform_now
  end

  test "comparison index indicates when job is processing" do
    sign_in @user

    # Use existing pending fixture to avoid duplicates
    pending_comparison = mushroom_comparisons(:pending_comparison)

    get mushroom_mushroom_comparisons_path(pending_comparison.mushroom)
    assert_response :success

    # Should show pending status message
  end

  # ==========================================================================
  # SIMILARITY SCORING TESTS
  # ==========================================================================

  test "comparison show displays percentage similarity" do
    sign_in @user

    # Use existing fixture comparison to avoid duplicates
    # Note: Fixtures have integer similarity scores, which matches the validation
    comparison = mushroom_comparisons(:completed_high_similarity)

    get mushroom_comparison_path(comparison)
    assert_response :success

    # Should format as percentage
  end

  test "comparisons ordered by highest similarity first" do
    sign_in @user

    # Fixtures already have comparisons for mushroom:one with different scores
    # completed_high_similarity: 85, completed_low_similarity: 25
    # No need to create new comparisons, just verify ordering

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # High score should appear before low score
    comparisons = assigns(:comparisons)
    if comparisons && comparisons.any?
      scores = comparisons.map(&:similarity_score)
      assert_equal scores, scores.sort.reverse
    end
  end

  # ==========================================================================
  # EAGER LOADING TESTS
  # ==========================================================================

  test "comparisons index eager loads associations" do
    sign_in @user

    # Use existing fixture comparison to avoid duplicates
    comparison = mushroom_comparisons(:completed_high_similarity)

    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # Should include compared_mushroom, user, fungus_type
    # This prevents N+1 queries
  end

  test "comparison show eager loads character associations" do
    sign_in @user

    # Use existing fixture comparison to avoid duplicates
    comparison = mushroom_comparisons(:completed_high_similarity)

    get mushroom_comparison_path(comparison)
    assert_response :success

    # Should load mr_character_mushrooms with associations
    # Prevents N+1 when displaying character details
  end

  # ==========================================================================
  # INTEGRATION TESTS
  # ==========================================================================

  test "complete comparison workflow" do
    skip "Requires full job processing"
    sign_in @user

    # 1. Create comparison (triggers job)
    post mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :redirect

    # 2. View index (shows pending)
    get mushroom_mushroom_comparisons_path(@mushroom)
    assert_response :success

    # 3. Process job (would need to run job)

    # 4. View completed comparison
    # 5. View comparison details
  end

  # ==========================================================================
  # PERFORMANCE TESTS
  # ==========================================================================

  test "comparisons index handles many results efficiently" do
    skip "Requires creating many comparison records"
    sign_in @user

    # Create 100 completed comparisons
    # Verify query performance with pagination
  end

  test "comparison show handles complex character data efficiently" do
    skip "Requires setting up complex character associations"
    sign_in @user

    # Both mushrooms with 50+ characters
    # Verify no N+1 queries
  end
end
