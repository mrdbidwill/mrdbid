require "rails_helper"

RSpec.describe "lens/show", type: :view do
  before(:each) do
    assign(:lens, Lens.create!(
      make: "Make",
      model: "Model",
      description: "MyText",
      comments: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
