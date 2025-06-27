require "rails_helper"

RSpec.describe "stem_locations/new", type: :view do
  before(:each) do
    assign(:stem_location, StemLocation.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new stem_location form" do
    render

    assert_select "form[action=?][method=?]", stem_locations_path, "post" do
      assert_select "input[name=?]", "stem_location[name]"

      assert_select "textarea[name=?]", "stem_location[description]"

      assert_select "textarea[name=?]", "stem_location[comments]"

      assert_select "input[name=?]", "stem_location[source]"
    end
  end
end
