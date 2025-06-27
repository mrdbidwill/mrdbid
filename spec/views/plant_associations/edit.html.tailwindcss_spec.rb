require "rails_helper"

RSpec.describe "plant_associations/edit", type: :view do
  let(:plant_association) {
    PlantAssociation.create!(
      mushroom: nil,
      plant: nil
    )
  }

  before(:each) do
    assign(:plant_association, plant_association)
  end

  it "renders the edit plant_association form" do
    render

    assert_select "form[action=?][method=?]", plant_association_path(plant_association), "post" do
      assert_select "input[name=?]", "plant_association[mushroom_id]"

      assert_select "input[name=?]", "plant_association[plant_id]"
    end
  end
end
