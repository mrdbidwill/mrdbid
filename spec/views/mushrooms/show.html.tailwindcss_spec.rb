require "rails_helper"

RSpec.describe "mushrooms/show", type: :view do
  before(:each) do
    assign(:mushroom, Mushroom.create!(
      mushroom_name: "Mushroom Name",
      description: "MyText",
      state: nil,
      country: nil,
      fungus_type: nil,
      mushroom_location: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mushroom Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
