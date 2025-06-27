require "rails_helper"

RSpec.describe "soil_types/new", type: :view do
  before(:each) do
    assign(:soil_type, SoilType.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new soil_type form" do
    render

    assert_select "form[action=?][method=?]", soil_types_path, "post" do
      assert_select "input[name=?]", "soil_type[name]"

      assert_select "textarea[name=?]", "soil_type[description]"

      assert_select "textarea[name=?]", "soil_type[comments]"

      assert_select "input[name=?]", "soil_type[source]"
    end
  end
end
