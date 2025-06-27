require "rails_helper"

RSpec.describe "image_mushroom_thumbnails/show", type: :view do
  before(:each) do
    assign(:image_mushroom_thumbnail, ImageMushroomThumbnail.create!(
      image_mushroom_id: nil,
      thumbnail_file_address: "Thumbnail File Address",
      image_width: 2,
      image_height: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Thumbnail File Address/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
