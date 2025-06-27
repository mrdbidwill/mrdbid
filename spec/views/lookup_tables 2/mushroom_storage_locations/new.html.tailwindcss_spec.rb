require "rails_helper"

RSpec.describe "mushroom_storage_locations/new", type: :view do
  before(:each) do
    assign(:mushroom_storage_location, MushroomStorageLocation.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new mushroom_storage_location form" do
    render

    assert_select "form[action=?][method=?]", mushroom_storage_locations_path, "post" do
      assert_select "input[name=?]", "mushroom_storage_location[name]"

      assert_select "textarea[name=?]", "mushroom_storage_location[description]"

      assert_select "textarea[name=?]", "mushroom_storage_location[comments]"

      assert_select "input[name=?]", "mushroom_storage_location[source]"
    end
  end
end
