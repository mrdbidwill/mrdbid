require "rails_helper"

RSpec.describe "plant_associations/new", type: :view do
  before(:each) do
    assign(:plant_association, PlantAssociation.new(
      mushroom: nil,
      plant: nil
    ))
  end

  it "renders new plant_association form" do
    render

    assert_select "form[action=?][method=?]", plant_associations_path, "post" do
      assert_select "input[name=?]", "plant_association[mushroom_id]"

      assert_select "input[name=?]", "plant_association[plant_id]"
    end
  end
end
