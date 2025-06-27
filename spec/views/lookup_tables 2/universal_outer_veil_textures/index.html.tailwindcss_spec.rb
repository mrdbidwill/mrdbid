require "rails_helper"

RSpec.describe "universal_outer_veil_textures/index", type: :view do
  before(:each) do
    assign(:universal_outer_veil_textures, [
      UniversalOuterVeilTexture.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      UniversalOuterVeilTexture.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of universal_outer_veil_textures" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
