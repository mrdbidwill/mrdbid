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
          name: "Portobello",
          description: "A healthy mushroom",
          country_id: countries(:one).id,
          state_id: states(:one).id,
          fungus_type_id: fungus_types(:one).id
      }
      }
    end
    # Controller redirects to image_mushrooms/new to add images to the new mushroom
    assert_redirected_to new_image_mushroom_path(mushroom_id: Mushroom.last.id)
  end


  test "should show mushroom" do
    get mushroom_path(@mushroom)
    assert_response :success
  end

  test "should update mushroom" do
    patch mushroom_path(@mushroom), params: {
      mushroom: {
        name: "Updated Name",
        description: "Updated description"
      }
    }
    assert_redirected_to mushroom_path(@mushroom)
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

end
