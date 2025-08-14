require "test_helper"

class CameraModelTest < ActiveSupport::TestCase
  def setup
    @camera_model = CameraModel.new(name: "Test Model", description: "Test Description")
  end

  test "should be valid with valid attributes" do
    assert @camera_model.valid?
  end

  test "should not be valid without a name" do
    @camera_model.name = nil
    assert_not @camera_model.valid?
    assert_includes @camera_model.errors[:name], "can't be blank"
  end

  test "can have many cameras" do
    assert_difference "@camera_model.cameras.count", 1 do
      @camera_model.cameras << cameras(:one) # Add a camera from the fixtures
    end
  end
end
