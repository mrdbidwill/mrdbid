require "test_helper"

class MushroomTest < ActiveSupport::TestCase
  test "should not save mushroom without name" do
    # Create an associated user
    user = User.create!(email: 'test@example.com', password: 'password123')

    # Attempt to save a mushroom without a name but with a user
    mushroom = Mushroom.new(user: user)
    assert_not mushroom.save, "Saved the mushroom without a name"
  end
end




