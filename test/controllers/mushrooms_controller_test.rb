require "test_helper"

class MushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Load a valid user from fixtures
    puts "Before sign_in: #{@user.inspect}" # Debug fixture data
    sign_in(@user)
    puts "After sign_in: #{@user.inspect}" # Debug fixture data
    @mushroom = mushrooms(:one) # Ensure @mushroom belongs to @user
  end

  test "mushroom attributes must not be empty" do
    mushroom = Mushroom.new  # No attributes set
    assert mushroom.invalid? # Confirm validation fails
    assert mushroom.errors[:name].any? # Name must be present
    assert mushroom.errors[:user].any? # User must also be present
  end

  test "should create mushroom" do
    puts "After sign_in: #{@user.current_user.inspect}" # Debug fixture data
    assert_difference("@user.mushrooms.count") do
      post mushrooms_path, params: {
        mushroom: {
          name: "Portobello",
          description: "A healthy mushroom"
        }
      }
    end
    assert_redirected_to mushroom_path(Mushroom.last)
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

  test "should destroy mushroom" do
    assert_difference("@user.mushrooms.count", -1) do
      delete mushroom_path(@mushroom)
    end
    assert_redirected_to mushrooms_path
  end
end
