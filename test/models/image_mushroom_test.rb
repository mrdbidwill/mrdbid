require "test_helper"

class ImageMushroomTest < ActiveSupport::TestCase
  def setup
    @mushroom = mushrooms(:one) # Retrieve a valid mushroom from fixtures
    @camera_make = camera_makes(:one)
    @camera_model = camera_models(:one)
    @lens = lenses(:one)
    @image_mushroom = ImageMushroom.new(
      mushroom: @mushroom,
      camera_make: @camera_make,
      camera_model: @camera_model,
      lens: @lens,
      image_name: "Test Image",
      image_width: 800,
      image_height: 600,
      exposure: "1/60",
      aperture: "f/2.8",
      iso: "100"
    )
  end



  test "should be valid with image_file attached" do
    @image_mushroom.image_file.attach(
      io: File.open(Rails.root.join("test/files/test_image.jpg")),
      filename: "test_image.jpg",
      content_type: "image/jpeg"
    )
    assert @image_mushroom.valid?
  end

  test "should require a valid mushroom" do
    @image_mushroom.mushroom = nil
    assert_not @image_mushroom.valid?
    assert_includes @image_mushroom.errors[:mushroom], "must exist"
  end

  test "should have optional camera_make and camera_model" do
    @image_mushroom.camera_make = nil
    @image_mushroom.camera_model = nil
    # These are optional, so should still be valid (if image_file is attached)
    assert_respond_to @image_mushroom, :camera_make
    assert_respond_to @image_mushroom, :camera_model
  end



  test "should require an image" do
    @image_mushroom.image_file.detach if @image_mushroom.image_file.attached?
    assert_not @image_mushroom.valid?
    assert_includes @image_mushroom.errors[:image_file], "An image file must be selected"
  end

  test "should get user_id from associated mushroom" do
    assert_equal users(:one).id, @image_mushroom.mushroom.user_id
  end

  test "should attach image_file" do
    @image_mushroom.image_file.attach(
      io: File.open(Rails.root.join("test/files/test_image.jpg")),
      filename: "test_image.jpg",
      content_type: "image/jpeg"
    )

    assert @image_mushroom.image_file.attached?, "Image file should be attached"
  end

  test "should not be valid without image_file" do
    @image_mushroom.image_file = nil
    assert_not @image_mushroom.valid?
    assert_includes @image_mushroom.errors[:image_file], "An image file must be selected"
  end

  test "should save image_mushroom with valid image_file" do
    @image_mushroom.image_file.attach(
      io: File.open(Rails.root.join("test/files/test_image.jpg")),
      filename: "test_image.jpg",
      content_type: "image/jpeg"
    )

    assert @image_mushroom.save, "ImageMushroom should save with a valid image_file"
  end

  test "should detach image_file" do
    @image_mushroom.image_file.attach(
      io: File.open(Rails.root.join("test/files/test_image.jpg")),
      filename: "test_image.jpg",
      content_type: "image/jpeg"
    )

    assert @image_mushroom.image_file.attached?, "Image file should be attached before detachment"
    @image_mushroom.image_file.purge
    assert_not @image_mushroom.image_file.attached?, "Image file should be detached"
  end

  test "should verify image_file metadata" do
    @image_mushroom.image_file.attach(
      io: File.open(Rails.root.join("test/files/test_image.jpg")),
      filename: "test_image.jpg",
      content_type: "image/jpeg"
    )

    assert_equal "test_image.jpg", @image_mushroom.image_file.filename.to_s
    assert_equal "image/jpeg", @image_mushroom.image_file.content_type
    assert @image_mushroom.image_file.byte_size > 0
  end

end
