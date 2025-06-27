require "rails_helper"

RSpec.describe "gill_edges/show", type: :view do
  before(:each) do
    assign(:gill_edge, GillEdge.create!(
      name: "Name",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
