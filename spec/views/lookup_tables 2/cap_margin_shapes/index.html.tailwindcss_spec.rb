require "rails_helper"

RSpec.describe "cap_margin_shapes/index", type: :view do
  before(:each) do
    assign(:cap_margin_shapes, [
      CapMarginShape.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      CapMarginShape.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of cap_margin_shapes" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
