require "rails_helper"

RSpec.describe "image_mushroom_thumbnails/edit", type: :view do
  let(:image_mushroom_thumbnail) {
    ImageMushroomThumbnail.create!(
      image_mushroom_id: nil,
      thumbnail_file_address: "MyString",
      image_width: 1,
      image_height: 1
    )
  }

  before(:each) do
    assign(:image_mushroom_thumbnail, image_mushroom_thumbnail)
  end

  it "renders the edit image_mushroom_thumbnail form" do
    render

    assert_select "form[action=?][method=?]", image_mushroom_thumbnail_path(image_mushroom_thumbnail), "post" do
      assert_select "input[name=?]", "image_mushroom_thumbnail[image_mushroom_id_id]"

      assert_select "input[name=?]", "image_mushroom_thumbnail[thumbnail_file_address]"

      assert_select "input[name=?]", "image_mushroom_thumbnail[image_width]"

      assert_select "input[name=?]", "image_mushroom_thumbnail[image_height]"
    end
  end
end
