require "rails_helper"

RSpec.describe "partial_inner_veil_fates/show", type: :view do
  before(:each) do
    assign(:partial_inner_veil_fate, PartialInnerVeilFate.create!(
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
