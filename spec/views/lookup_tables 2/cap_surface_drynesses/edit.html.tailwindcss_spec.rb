require "rails_helper"

RSpec.describe "cap_surface_drynesses/edit", type: :view do
  let(:cap_surface_dryness) {
    CapSurfaceDryness.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:cap_surface_dryness, cap_surface_dryness)
  end

  it "renders the edit cap_surface_dryness form" do
    render

    assert_select "form[action=?][method=?]", cap_surface_dryness_path(cap_surface_dryness), "post" do
      assert_select "input[name=?]", "cap_surface_dryness[name]"

      assert_select "textarea[name=?]", "cap_surface_dryness[description]"

      assert_select "textarea[name=?]", "cap_surface_dryness[comments]"

      assert_select "input[name=?]", "cap_surface_dryness[source]"
    end
  end
end
