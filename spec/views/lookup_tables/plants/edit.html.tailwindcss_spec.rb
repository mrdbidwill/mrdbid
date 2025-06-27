require "rails_helper"

RSpec.describe "plants/edit", type: :view do
  let(:plant) {
    Plant.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:plant, plant)
  end

  it "renders the edit plant form" do
    render

    assert_select "form[action=?][method=?]", plant_path(plant), "post" do
      assert_select "input[name=?]", "plant[name]"

      assert_select "textarea[name=?]", "plant[description]"

      assert_select "textarea[name=?]", "plant[comments]"

      assert_select "input[name=?]", "plant[source]"
    end
  end
end
