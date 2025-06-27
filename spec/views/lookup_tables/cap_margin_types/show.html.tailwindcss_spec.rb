require "rails_helper"

RSpec.describe "cap_margin_types/show", type: :view do
  before(:each) do
    assign(:cap_margin_type, CapMarginType.create!(
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
