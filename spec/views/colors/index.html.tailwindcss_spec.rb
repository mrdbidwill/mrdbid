require "rails_helper"

RSpec.describe "colors/index", type: :view do
  before(:each) do
    assign(:colors, [
      Color.create!(
        latin_name: "Latin Name",
        common_name: "Common Name",
        color_group: 2,
        hex: "Hex",
        sequence_number: 3,
        r_val: 4,
        g_val: 5,
        b_val: 6,
        closest_websafe_color: "Closest Websafe Color",
        cwc_r: 7,
        cwc_g: 8,
        cwc_b: 9,
        image_file: "Image File"
      ),
      Color.create!(
        latin_name: "Latin Name",
        common_name: "Common Name",
        color_group: 2,
        hex: "Hex",
        sequence_number: 3,
        r_val: 4,
        g_val: 5,
        b_val: 6,
        closest_websafe_color: "Closest Websafe Color",
        cwc_r: 7,
        cwc_g: 8,
        cwc_b: 9,
        image_file: "Image File"
      )
    ])
  end

  it "renders a list of colors" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Latin Name"), count: 2
    assert_select cell_selector, text: Regexp.new("Common Name"), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Hex"), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(6.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Closest Websafe Color"), count: 2
    assert_select cell_selector, text: Regexp.new(7.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(8.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(9.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Image File"), count: 2
  end
end
