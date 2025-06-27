require "rails_helper"

RSpec.describe "cap_surface_drynesses/new", type: :view do
  before(:each) do
    assign(:cap_surface_dryness, CapSurfaceDryness.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new cap_surface_dryness form" do
    render

    assert_select "form[action=?][method=?]", cap_surface_drynesses_path, "post" do
      assert_select "input[name=?]", "cap_surface_dryness[name]"

      assert_select "textarea[name=?]", "cap_surface_dryness[description]"

      assert_select "textarea[name=?]", "cap_surface_dryness[comments]"

      assert_select "input[name=?]", "cap_surface_dryness[source]"
    end
  end
end
