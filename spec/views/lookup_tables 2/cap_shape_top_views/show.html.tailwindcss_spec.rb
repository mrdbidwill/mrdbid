require "rails_helper"

RSpec.describe "cap_shape_top_views/show", type: :view do
  before(:each) do
    assign(:cap_shape_top_view, CapShapeTopView.create!(
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
