require "application_system_test_case"

class ImageMushroomThumbnailsTest < ApplicationSystemTestCase
  setup do
    @image_mushroom_thumbnail = image_mushroom_thumbnails(:one)
  end

  test "visiting the index" do
    visit image_mushroom_thumbnails_url
    assert_selector "h1", text: "Image mushroom thumbnails"
  end

  test "should create image mushroom thumbnail" do
    visit image_mushroom_thumbnails_url
    click_on "New image mushroom thumbnail"

    fill_in "Entered by", with: @image_mushroom_thumbnail.entered_by_id
    fill_in "Image height", with: @image_mushroom_thumbnail.image_height
    fill_in "Image mushroom id", with: @image_mushroom_thumbnail.image_mushroom_id_id
    fill_in "Image width", with: @image_mushroom_thumbnail.image_width
    fill_in "Thumbnail file address", with: @image_mushroom_thumbnail.thumbnail_file_address
    click_on "Create Image mushroom thumbnail"

    assert_text "Image mushroom thumbnail was successfully created"
    click_on "Back"
  end

  test "should update Image mushroom thumbnail" do
    visit image_mushroom_thumbnail_url(@image_mushroom_thumbnail)
    click_on "Edit this image mushroom thumbnail", match: :first

    fill_in "Entered by", with: @image_mushroom_thumbnail.entered_by_id
    fill_in "Image height", with: @image_mushroom_thumbnail.image_height
    fill_in "Image mushroom id", with: @image_mushroom_thumbnail.image_mushroom_id_id
    fill_in "Image width", with: @image_mushroom_thumbnail.image_width
    fill_in "Thumbnail file address", with: @image_mushroom_thumbnail.thumbnail_file_address
    click_on "Update Image mushroom thumbnail"

    assert_text "Image mushroom thumbnail was successfully updated"
    click_on "Back"
  end

  test "should destroy Image mushroom thumbnail" do
    visit image_mushroom_thumbnail_url(@image_mushroom_thumbnail)
    accept_confirm { click_on "Destroy this image mushroom thumbnail", match: :first }

    assert_text "Image mushroom thumbnail was successfully destroyed"
  end
end
