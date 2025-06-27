require "rails_helper"

RSpec.describe "image_mushrooms/show", type: :view do
  before(:each) do
    assign(:image_mushroom, ImageMushroom.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Image Name/)
    expect(rendered).to match(/Image File Address/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Camera Model/)
    expect(rendered).to match(/Lens/)
    expect(rendered).to match(/Exposure/)
    expect(rendered).to match(/Aperture/)
    expect(rendered).to match(/Iso/)
  end
end
