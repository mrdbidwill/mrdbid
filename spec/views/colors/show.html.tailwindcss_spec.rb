require "rails_helper"

RSpec.describe "colors/show", type: :view do
  before(:each) do
    assign(:color, Color.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Latin Name/)
    expect(rendered).to match(/Common Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Hex/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/Closest Websafe Color/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/Image File/)
  end
end
