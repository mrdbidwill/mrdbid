require "rails_helper"

RSpec.describe "image_mushrooms/index", type: :view do
  before(:each) do
    assign(:image_mushrooms, [
      ImageMushroom.create!(
        mushroom_id: nil,
        parts: nil,
        image_name: "Image Name",
        image_file_address: "Image File Address",
        image_width: 2,
        image_height: 3,
        camera_make: nil,
        camera_model: "Camera Model",
        lens: "Lens",
        exposure: "Exposure",
        aperture: "Aperture",
        iso: "Iso"
      ),
      ImageMushroom.create!(
        mushroom_id: nil,
        parts: nil,
        image_name: "Image Name",
        image_file_address: "Image File Address",
        image_width: 2,
        image_height: 3,
        camera_make: nil,
        camera_model: "Camera Model",
        lens: "Lens",
        exposure: "Exposure",
        aperture: "Aperture",
        iso: "Iso"
      )
    ])
  end

  it "renders a list of image_mushrooms" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Image Name"), count: 2
    assert_select cell_selector, text: Regexp.new("Image File Address"), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Camera Model"), count: 2
    assert_select cell_selector, text: Regexp.new("Lens"), count: 2
    assert_select cell_selector, text: Regexp.new("Exposure"), count: 2
    assert_select cell_selector, text: Regexp.new("Aperture"), count: 2
    assert_select cell_selector, text: Regexp.new("Iso"), count: 2
  end
end
