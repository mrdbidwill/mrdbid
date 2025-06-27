require "rails_helper"

RSpec.describe "colors/new", type: :view do
  before(:each) do
    assign(:color, Color.new(
      latin_name: "MyString",
      common_name: "MyString",
      color_group: 1,
      hex: "MyString",
      sequence_number: 1,
      r_val: 1,
      g_val: 1,
      b_val: 1,
      closest_websafe_color: "MyString",
      cwc_r: 1,
      cwc_g: 1,
      cwc_b: 1,
      image_file: "MyString"
    ))
  end

  it "renders new color form" do
    render

    assert_select "form[action=?][method=?]", colors_path, "post" do
      assert_select "input[name=?]", "color[latin_name]"

      assert_select "input[name=?]", "color[common_name]"

      assert_select "input[name=?]", "color[color_group]"

      assert_select "input[name=?]", "color[hex]"

      assert_select "input[name=?]", "color[sequence_number]"

      assert_select "input[name=?]", "color[r_val]"

      assert_select "input[name=?]", "color[g_val]"

      assert_select "input[name=?]", "color[b_val]"

      assert_select "input[name=?]", "color[closest_websafe_color]"

      assert_select "input[name=?]", "color[cwc_r]"

      assert_select "input[name=?]", "color[cwc_g]"

      assert_select "input[name=?]", "color[cwc_b]"

      assert_select "input[name=?]", "color[image_file]"
    end
  end
end
