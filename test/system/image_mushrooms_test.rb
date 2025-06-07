require "application_system_test_case"

class ImageMushroomsTest < ApplicationSystemTestCase
  setup do
    @image_mushroom = image_mushrooms(:one)
  end

  test "visiting the index" do
    visit image_mushrooms_url
    assert_selector "h1", text: "Image mushrooms"
  end

  test "should create image mushroom" do
    visit image_mushrooms_url
    click_on "New image mushroom"

    fill_in "Gpsaltitude", with: @image_mushroom.GPSAltitude
    fill_in "Gpsaltituderef", with: @image_mushroom.GPSAltitudeRef
    fill_in "Gpslatituderef", with: @image_mushroom.GPSLatitudeRef
    fill_in "Gpslatitude 0", with: @image_mushroom.GPSLatitude_0
    fill_in "Gpslatitude 1", with: @image_mushroom.GPSLatitude_1
    fill_in "Gpslatitude 2", with: @image_mushroom.GPSLatitude_2
    fill_in "Gpslongituderef", with: @image_mushroom.GPSLongitudeRef
    fill_in "Gpslongitude 0", with: @image_mushroom.GPSLongitude_0
    fill_in "Gpslongitude 1", with: @image_mushroom.GPSLongitude_1
    fill_in "Gpslongitude 2", with: @image_mushroom.GPSLongitude_2
    fill_in "Aperture", with: @image_mushroom.aperture
    fill_in "Camera make", with: @image_mushroom.camera_make_id
    fill_in "Camera model", with: @image_mushroom.camera_model
    fill_in "Date taken", with: @image_mushroom.date_taken
    fill_in "Description", with: @image_mushroom.description
    fill_in "Entered by", with: @image_mushroom.entered_by_id
    fill_in "Exposure", with: @image_mushroom.exposure
    fill_in "File address", with: @image_mushroom.file_address
    fill_in "Focal length", with: @image_mushroom.focal_length
    fill_in "Image height", with: @image_mushroom.image_height
    fill_in "Image name", with: @image_mushroom.image_name
    fill_in "Image width", with: @image_mushroom.image_width
    fill_in "Iso", with: @image_mushroom.iso
    fill_in "Lens", with: @image_mushroom.lens
    fill_in "Mushroom id", with: @image_mushroom.mushroom_id_id
    fill_in "Parts", with: @image_mushroom.parts_id
    click_on "Create Image mushroom"

    assert_text "Image mushroom was successfully created"
    click_on "Back"
  end

  test "should update Image mushroom" do
    visit image_mushroom_url(@image_mushroom)
    click_on "Edit this image mushroom", match: :first

    fill_in "Gpsaltitude", with: @image_mushroom.GPSAltitude
    fill_in "Gpsaltituderef", with: @image_mushroom.GPSAltitudeRef
    fill_in "Gpslatituderef", with: @image_mushroom.GPSLatitudeRef
    fill_in "Gpslatitude 0", with: @image_mushroom.GPSLatitude_0
    fill_in "Gpslatitude 1", with: @image_mushroom.GPSLatitude_1
    fill_in "Gpslatitude 2", with: @image_mushroom.GPSLatitude_2
    fill_in "Gpslongituderef", with: @image_mushroom.GPSLongitudeRef
    fill_in "Gpslongitude 0", with: @image_mushroom.GPSLongitude_0
    fill_in "Gpslongitude 1", with: @image_mushroom.GPSLongitude_1
    fill_in "Gpslongitude 2", with: @image_mushroom.GPSLongitude_2
    fill_in "Aperture", with: @image_mushroom.aperture
    fill_in "Camera make", with: @image_mushroom.camera_make_id
    fill_in "Camera model", with: @image_mushroom.camera_model
    fill_in "Date taken", with: @image_mushroom.date_taken
    fill_in "Description", with: @image_mushroom.description
    fill_in "Entered by", with: @image_mushroom.entered_by_id
    fill_in "Exposure", with: @image_mushroom.exposure
    fill_in "File address", with: @image_mushroom.file_address
    fill_in "Focal length", with: @image_mushroom.focal_length
    fill_in "Image height", with: @image_mushroom.image_height
    fill_in "Image name", with: @image_mushroom.image_name
    fill_in "Image width", with: @image_mushroom.image_width
    fill_in "Iso", with: @image_mushroom.iso
    fill_in "Lens", with: @image_mushroom.lens
    fill_in "Mushroom id", with: @image_mushroom.mushroom_id_id
    fill_in "Parts", with: @image_mushroom.parts_id
    click_on "Update Image mushroom"

    assert_text "Image mushroom was successfully updated"
    click_on "Back"
  end

  test "should destroy Image mushroom" do
    visit image_mushroom_url(@image_mushroom)
    accept_confirm { click_on "Destroy this image mushroom", match: :first }

    assert_text "Image mushroom was successfully destroyed"
  end
end
