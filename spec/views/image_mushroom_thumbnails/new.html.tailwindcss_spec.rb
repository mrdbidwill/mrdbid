require "rails_helper"

RSpec.describe "image_mushroom_thumbnails/new", type: :view do
  before(:each) do
    assign(:image_mushroom_thumbnail, ImageMushroomThumbnail.new(
      image_mushroom_id: nil,
      thumbnail_file_address: "MyString",
      image_width: 1,
      image_height: 1
    ))
  end

  it "renders new image_mushroom_thumbnail form" do
    render

    assert_select "form[action=?][method=?]", image_mushroom_thumbnails_path, "post" do
      assert_select "input[name=?]", "image_mushroom_thumbnail[image_mushroom_id_id]"

      assert_select "input[name=?]", "image_mushroom_thumbnail[thumbnail_file_address]"

      assert_select "input[name=?]", "image_mushroom_thumbnail[image_width]"

      assert_select "input[name=?]", "image_mushroom_thumbnail[image_height]"
    end
  end
end
