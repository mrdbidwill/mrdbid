require "rails_helper"

RSpec.describe "plant_associations/index", type: :view do
  before(:each) do
    assign(:plant_associations, [
      PlantAssociation.create!(
        mushroom: nil,
        plant: nil
      ),
      PlantAssociation.create!(
        mushroom: nil,
        plant: nil
      )
    ])
  end

  it "renders a list of plant_associations" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
