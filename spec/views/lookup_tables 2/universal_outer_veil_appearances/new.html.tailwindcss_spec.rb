require "rails_helper"

RSpec.describe "universal_outer_veil_appearances/new", type: :view do
  before(:each) do
    assign(:universal_outer_veil_appearance, UniversalOuterVeilAppearance.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new universal_outer_veil_appearance form" do
    render

    assert_select "form[action=?][method=?]", universal_outer_veil_appearances_path, "post" do
      assert_select "input[name=?]", "universal_outer_veil_appearance[name]"

      assert_select "textarea[name=?]", "universal_outer_veil_appearance[description]"

      assert_select "textarea[name=?]", "universal_outer_veil_appearance[comments]"

      assert_select "input[name=?]", "universal_outer_veil_appearance[source]"
    end
  end
end
