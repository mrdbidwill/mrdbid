require "rails_helper"

RSpec.describe "gill_breadths/show", type: :view do
  before(:each) do
    assign(:gill_breadth, GillBreadth.create!(
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
