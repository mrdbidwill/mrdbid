require "rails_helper"

RSpec.describe "stem_locations/edit", type: :view do
  let(:stem_location) {
    StemLocation.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:stem_location, stem_location)
  end

  it "renders the edit stem_location form" do
    render

    assert_select "form[action=?][method=?]", stem_location_path(stem_location), "post" do
      assert_select "input[name=?]", "stem_location[name]"

      assert_select "textarea[name=?]", "stem_location[description]"

      assert_select "textarea[name=?]", "stem_location[comments]"

      assert_select "input[name=?]", "stem_location[source]"
    end
  end
end
