require "test_helper"

class ImageMushroomTest < ActiveSupport::TestCase
  def setup
    @camera_make = camera_makes(:one) # Retrieve a valid camera_make from fixtures
    @camera_model = camera_models(:one) # Retrieve a valid camera_model from fixtures
    @mushroom = mushrooms(:one) # Retrieve a valid mushroom from fixtures
    @image_mushroom = image_mushrooms(:one) # Retrieve a valid image_mushroom from fixtures

    # Explicitly associate the valid mushroom, camera_make, and camera_model
    @image_mushroom.mushroom = @mushroom
    @image_mushroom.camera_make = @camera_make
    @image_mushroom.camera_model = @camera_model

    # Ensure the image file is attached
    @image_mushroom.image_file.attach(
      io: File.open(Rails.root.join('test/fixtures/files/test_image.jpg')),
      filename: 'test_image.jpg',
      content_type: 'image/jpeg'
    )
  end


  test "should be valid" do
    assert @image_mushroom.valid?
  end

  test "should require a valid mushroom" do
    @image_mushroom.mushroom = nil
    assert_not @image_mushroom.valid?
    assert_includes @image_mushroom.errors[:mushroom], "must exist"
  end

  test "should require a valid camera make and model" do
    @image_mushroom.camera_make = nil
    @image_mushroom.camera_model = nil
    assert_not @image_mushroom.valid?
    assert_includes @image_mushroom.errors[:camera_make], "must exist"
    assert_includes @image_mushroom.errors[:camera_model], "must exist"
  end



  test "should require an image" do
    @image_mushroom.image_file.detach if @image_mushroom.image_file.attached?
    assert_not @image_mushroom.valid?
    assert_includes @image_mushroom.errors[:image_file], "An image file must be selected"
  end

  test "should get user_id from associated mushroom" do
    assert_equal users(:one).id, @image_mushroom.mushroom.user_id
  end

end
