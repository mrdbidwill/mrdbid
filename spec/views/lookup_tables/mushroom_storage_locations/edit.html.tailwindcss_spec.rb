require "rails_helper"

RSpec.describe "mushroom_storage_locations/edit", type: :view do
  let(:mushroom_storage_location) {
    MushroomStorageLocation.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:mushroom_storage_location, mushroom_storage_location)
  end

  it "renders the edit mushroom_storage_location form" do
    render

    assert_select "form[action=?][method=?]", mushroom_storage_location_path(mushroom_storage_location), "post" do
      assert_select "input[name=?]", "mushroom_storage_location[name]"

      assert_select "textarea[name=?]", "mushroom_storage_location[description]"

      assert_select "textarea[name=?]", "mushroom_storage_location[comments]"

      assert_select "input[name=?]", "mushroom_storage_location[source]"
    end
  end
end
