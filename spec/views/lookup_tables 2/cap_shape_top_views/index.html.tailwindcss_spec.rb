require "rails_helper"

RSpec.describe "cap_shape_top_views/index", type: :view do
  before(:each) do
    assign(:cap_shape_top_views, [
      CapShapeTopView.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      CapShapeTopView.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of cap_shape_top_views" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
