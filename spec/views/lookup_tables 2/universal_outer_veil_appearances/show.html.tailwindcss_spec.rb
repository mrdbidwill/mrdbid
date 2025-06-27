require "rails_helper"

RSpec.describe "universal_outer_veil_appearances/show", type: :view do
  before(:each) do
    assign(:universal_outer_veil_appearance, UniversalOuterVeilAppearance.create!(
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
