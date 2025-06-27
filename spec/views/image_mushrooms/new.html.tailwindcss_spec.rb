require "rails_helper"

RSpec.describe "image_mushrooms/new", type: :view do
  before(:each) do
    assign(:image_mushroom, ImageMushroom.new(
      mushroom_id: nil,
      parts: nil,
      image_name: "MyString",
      image_file_address: "MyString",
      image_width: 1,
      image_height: 1,
      camera_make: nil,
      camera_model: "MyString",
      lens: "MyString",
      exposure: "MyString",
      aperture: "MyString",
      iso: "MyString"
    ))
  end

  it "renders new image_mushroom form" do
    render

    assert_select "form[action=?][method=?]", image_mushrooms_path, "post" do
      assert_select "input[name=?]", "image_mushroom[mushroom_id_id]"

      assert_select "input[name=?]", "image_mushroom[parts_id]"

      assert_select "input[name=?]", "image_mushroom[image_name]"

      assert_select "input[name=?]", "image_mushroom[image_file_address]"

      assert_select "input[name=?]", "image_mushroom[image_width]"

      assert_select "input[name=?]", "image_mushroom[image_height]"

      assert_select "input[name=?]", "image_mushroom[camera_make_id]"

      assert_select "input[name=?]", "image_mushroom[camera_model]"

      assert_select "input[name=?]", "image_mushroom[lens]"

      assert_select "input[name=?]", "image_mushroom[exposure]"

      assert_select "input[name=?]", "image_mushroom[aperture]"

      assert_select "input[name=?]", "image_mushroom[iso]"
    end
  end
end
