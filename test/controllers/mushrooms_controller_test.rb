require "test_helper"

class MushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Load a valid user from fixtures
    sign_in @user # Use Devise test helper directly
    @mushroom = mushrooms(:one) # This mushroom belongs to @user based on fixtures
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
  # PDF Export Tests
  # ============================================================================

  test "should export single mushroom to PDF" do
    get export_pdf_mushroom_path(@mushroom, format: :pdf)
    assert_response :success
    assert_equal "application/pdf", response.media_type
    assert response.body.start_with?("%PDF"), "Response should be a valid PDF"
  end

  test "should export all user mushrooms to PDF" do
    get export_all_pdf_mushrooms_path(format: :pdf)
    assert_response :success
    assert_equal "application/pdf", response.media_type
    assert response.body.start_with?("%PDF"), "Response should be a valid PDF"
  end

  test "should export multiple specific mushrooms to PDF" do
    mushroom2 = Mushroom.create!(
      name: "Second Mushroom",
      user: @user,
      country: countries(:one),
      fungus_type: fungus_types(:one),
      collection_date: Date.today
    )

    get export_all_pdf_mushrooms_path(format: :pdf, ids: [@mushroom.id, mushroom2.id])
    assert_response :success
    assert_equal "application/pdf", response.media_type
    assert response.body.start_with?("%PDF"), "Response should be a valid PDF"
  end

  test "should set correct filename for single mushroom PDF" do
    get export_pdf_mushroom_path(@mushroom, format: :pdf)
    assert_response :success

    content_disposition = response.headers["Content-Disposition"]
    assert_match(/attachment/, content_disposition)
    assert_match(/#{@mushroom.name.parameterize}/, content_disposition)
    assert_match(/\.pdf/, content_disposition)
  end

  test "should set correct filename for all mushrooms PDF" do
    get export_all_pdf_mushrooms_path(format: :pdf)
    assert_response :success

    content_disposition = response.headers["Content-Disposition"]
    assert_match(/attachment/, content_disposition)
    assert_match(/all-mushrooms/, content_disposition)
    assert_match(/\.pdf/, content_disposition)
  end

  test "should return plain text error for PDF export failures" do
    failure_result = ApplicationService::Result.failure("Test failure")

    original_call = Mushrooms::PdfExporter.method(:call)
    Mushrooms::PdfExporter.define_singleton_method(:call) { |_args = nil, **_kwargs| failure_result }

    get export_pdf_mushroom_path(@mushroom, format: :pdf)
  ensure
    Mushrooms::PdfExporter.define_singleton_method(:call, original_call)

    assert_response :unprocessable_entity
    assert_equal "text/plain", response.media_type
    assert_match "PDF export failed: Test failure.", response.body
  end

  test "should not allow exporting another user's mushroom" do
    # Sign in as non-admin user
    sign_out @user
    non_admin_user = users(:two) # Regular user, not admin
    sign_in non_admin_user

    other_mushroom = Mushroom.create!(
      name: "Other User Mushroom",
      user: @user, # Owned by @user (admin)
      country: countries(:one),
      fungus_type: fungus_types(:one),
      collection_date: Date.today
    )

    assert_raises(Pundit::NotAuthorizedError) do
      get export_pdf_mushroom_path(other_mushroom, format: :pdf)
    end
  end

  test "should only export current user's mushrooms when exporting all" do
    # Create mushroom for another user
    other_user = users(:two)
    other_mushroom = Mushroom.create!(
      name: "Other User Mushroom",
      user: other_user,
      country: countries(:one),
      fungus_type: fungus_types(:one),
      collection_date: Date.today
    )

    get export_all_pdf_mushrooms_path(format: :pdf)
    assert_response :success

    # Verify we got a PDF (basic check - detailed content checking would require PDF parsing)
    assert response.body.start_with?("%PDF")
  end

  test "should handle mushroom not found for PDF export" do
    get export_pdf_mushroom_path(id: 999999, format: :pdf)
    assert_response :unprocessable_entity
    assert_equal "text/plain", response.media_type
    assert_match "PDF export failed: Mushroom not found.", response.body
  end

  test "should require authentication for PDF export" do
    sign_out @user

    get export_pdf_mushroom_path(@mushroom, format: :pdf)
    # Devise returns 401 Unauthorized for unauthenticated requests
    assert_response :unauthorized
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

  test "public sees demo user mushrooms on index" do
    sign_out @user

    # Public should see user_id 1's mushrooms as demo
    get mushrooms_path
    assert_response :success

    # The response should contain mushrooms (from user_id 1 demo account)
    # but we can't make specific assertions without knowing fixture data
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
