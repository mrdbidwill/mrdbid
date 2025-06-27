require "rails_helper"

RSpec.describe "image_mushroom_thumbnails/index", type: :view do
  before(:each) do
    assign(:image_mushroom_thumbnails, [
      ImageMushroomThumbnail.create!(
        image_mushroom_id: nil,
        thumbnail_file_address: "Thumbnail File Address",
        image_width: 2,
        image_height: 3
      ),
      ImageMushroomThumbnail.create!(
        image_mushroom_id: nil,
        thumbnail_file_address: "Thumbnail File Address",
        image_width: 2,
        image_height: 3
      )
    ])
  end

  it "renders a list of image_mushroom_thumbnails" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Thumbnail File Address"), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
