require "test_helper"

class MushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Load a valid user from fixtures
    sign_in @user # Use Devise test helper directly
    @mushroom = mushrooms(:one) # This mushroom belongs to @user based on fixtures
    @demo_mushroom = mushrooms(:demo)
  end


  test "mushroom attributes must not be empty" do
    mushroom = Mushroom.new  # No attributes set
    assert mushroom.invalid? # Confirm validation fails
    assert mushroom.errors[:name].any? # Name must be present
    assert mushroom.errors[:user].any? # User must also be present
  end

  test "should create mushroom" do
    assert_difference("Mushroom.where(user_id: @user.id).count") do
      post mushrooms_path, params: {
        mushroom: {
          name: "Oyster Mushroom",
          description: "A healthy mushroom",
          country_id: countries(:one).id,
          state_id: states(:one).id,
          fungus_type_id: fungus_types(:one).id,
          collection_date: 5.days.ago.to_date,
      }
      }
    end
    # Controller redirects to image_mushrooms/new to add images to the new mushroom
    assert_redirected_to new_image_mushroom_path(mushroom_id: Mushroom.last.id)
    assert_equal 5.days.ago.to_date, Mushroom.last.collection_date
  end


  test "should show mushroom" do
    get mushroom_path(@mushroom)
    assert_response :success
  end

  test "should allow any user to view mushroom owned by another user" do
    # mushroom two belongs to user two
    other_mushroom = mushrooms(:two)
    assert_not_equal @user.id, other_mushroom.user_id

    # user one should be able to view user two's mushroom
    get mushroom_path(other_mushroom)
    assert_response :success
  end

  test "should update mushroom" do
    patch mushroom_path(@mushroom), params: {
      mushroom: {
        name: "Updated Name",
        description: "Updated description",
        collection_date: Date.today
      }
    }
    assert_redirected_to mushroom_path(@mushroom)
    @mushroom.reload
    assert_equal "Updated Name", @mushroom.name
    assert_equal Date.today, @mushroom.collection_date
  end

  test "should redirect back to return_to after successful update" do
    return_to = edit_matrix_mushroom_path(@mushroom, observation_tab: "macro", core_only: true, anchor: "basic-info")

    patch mushroom_path(@mushroom), params: {
      mushroom: { name: "Updated From Matrix" },
      return_to: return_to
    }

    assert_redirected_to return_to
    @mushroom.reload
    assert_equal "Updated From Matrix", @mushroom.name
  end

  test "should redirect back to return_to with alert when update fails" do
    return_to = edit_matrix_mushroom_path(@mushroom, observation_tab: "macro", core_only: true, anchor: "basic-info")

    patch mushroom_path(@mushroom), params: {
      mushroom: { name: "" },
      return_to: return_to
    }

    assert_redirected_to return_to
    assert_match(/Name/, flash[:alert].to_s)
  end

  test "should destroy mushroom and associated image_mushrooms" do
    associated_image_mushrooms = @mushroom.image_mushrooms.count
    assert_difference("Mushroom.where(user_id: @user.id).count", -1) do
      assert_difference("ImageMushroom.count", -associated_image_mushrooms) do
        delete mushroom_path(@mushroom)
      end
    end
    assert_redirected_to mushrooms_path
  end

  # ============================================================================
  # Public Access Tests (Pundit Authorization)
  # ============================================================================
  # These tests ensure that public pages work correctly for unauthenticated users
  # and don't raise Pundit::NotAuthorizedError or fail verify_authorized callbacks

  test "public can access index without authentication" do
    sign_out @user

    get mushrooms_path
    assert_response :success, "Public users should be able to view mushrooms index"
    assert_not_includes response.body, "Internal Server Error"
    # Should not raise Pundit::NotAuthorizedError
  end

  test "public can access show without authentication" do
    sign_out @user

    get mushroom_path(@mushroom)
    assert_response :success, "Public users should be able to view individual mushrooms"
    assert_not_includes response.body, "Internal Server Error"
    # Should not raise Pundit::NotAuthorizedError
  end

  test "public can access mushrooms from other owners without authentication" do
    sign_out @user

    get mushroom_path(mushrooms(:two))
    assert_response :success
  end

  test "public sees mushrooms from multiple owners on index" do
    sign_out @user

    get mushrooms_path
    assert_response :success

    assert_select "a[href='#{mushroom_path(@demo_mushroom)}']"
    assert_select "a[href='#{mushroom_path(@mushroom)}']"
  end

  test "public cannot access new without authentication" do
    sign_out @user

    get new_mushroom_path
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "public cannot access edit without authentication" do
    sign_out @user

    get edit_mushroom_path(@mushroom)
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "authenticated user should get desktop matrix edit view" do
    get edit_matrix_mushroom_path(@mushroom), headers: { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 14_4)" }
    assert_response :success
    assert_select "a[href='#{mushroom_path(@mushroom)}']", text: /Return to Mushroom/
    assert_match "Owner Quick Edit", response.body
  end

  test "matrix edit hides owner quick edit for admin viewing another users mushroom" do
    sign_out @user
    sign_in users(:three)

    get edit_matrix_mushroom_path(mushrooms(:two)), headers: { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 14_4)" }
    assert_response :success
    assert_no_match "Owner Quick Edit", response.body
  end

  test "phone user-agent should redirect matrix edit to legacy edit" do
    get edit_matrix_mushroom_path(@mushroom),
        headers: { "User-Agent" => "Mozilla/5.0 (Linux; Android 14; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36" }
    assert_redirected_to edit_mushroom_path(@mushroom)
  end

  test "public cannot access matrix edit without authentication" do
    sign_out @user

    get edit_matrix_mushroom_path(@mushroom)
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "public cannot create mushrooms without authentication" do
    sign_out @user

    assert_no_difference("Mushroom.count") do
      post mushrooms_path, params: {
        mushroom: {
          name: "Unauthorized Mushroom",
          country_id: countries(:one).id,
          fungus_type_id: fungus_types(:one).id,
          collection_date: Date.today
        }
      }
    end

    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

end
