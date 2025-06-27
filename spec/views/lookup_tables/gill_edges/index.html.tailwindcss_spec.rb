require "rails_helper"

RSpec.describe "gill_edges/index", type: :view do
  before(:each) do
    assign(:gill_edges, [
      GillEdge.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      GillEdge.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of gill_edges" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
