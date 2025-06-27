require "rails_helper"

RSpec.describe "states/show", type: :view do
  before(:each) do
    assign(:state, State.create!(
      name: "Name",
      description: "MyText",
      comments: "MyText",
      source: nil,
      country: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
