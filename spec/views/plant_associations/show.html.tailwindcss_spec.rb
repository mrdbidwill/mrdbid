require "rails_helper"

RSpec.describe "plant_associations/show", type: :view do
  before(:each) do
    assign(:plant_association, PlantAssociation.create!(
      mushroom: nil,
      plant: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
