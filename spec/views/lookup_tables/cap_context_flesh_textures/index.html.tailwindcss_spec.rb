require "rails_helper"

RSpec.describe "cap_context_flesh_textures/index", type: :view do
  before(:each) do
    assign(:cap_context_flesh_textures, [
      CapContextFleshTexture.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      CapContextFleshTexture.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of cap_context_flesh_textures" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
