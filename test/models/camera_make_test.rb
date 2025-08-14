require "test_helper"

class CameraMakeTest < ActiveSupport::TestCase
  def setup
    @camera_make = CameraMake.new(name: "Test Make", description: "Test Description")
  end

  test "should be valid with valid attributes" do
    assert @camera_make.valid?
  end

  test "should not be valid without a name" do
    @camera_make.name = nil
    assert_not @camera_make.valid?
    assert_includes @camera_make.errors[:name], "can't be blank"
  end

  test "can have many cameras" do
    assert_difference "@camera_make.cameras.count", 1 do
      @camera_make.cameras << cameras(:one) # Add a camera from the fixtures
    end
  end
end

