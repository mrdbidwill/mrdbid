require "rails_helper"

RSpec.describe "mushroom_ages/show", type: :view do
  before(:each) do
    assign(:mushroom_age, MushroomAge.create!(
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
