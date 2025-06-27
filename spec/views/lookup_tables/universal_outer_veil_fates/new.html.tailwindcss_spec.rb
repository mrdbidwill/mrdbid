require "rails_helper"

RSpec.describe "universal_outer_veil_fates/new", type: :view do
  before(:each) do
    assign(:universal_outer_veil_fate, UniversalOuterVeilFate.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new universal_outer_veil_fate form" do
    render

    assert_select "form[action=?][method=?]", universal_outer_veil_fates_path, "post" do
      assert_select "input[name=?]", "universal_outer_veil_fate[name]"

      assert_select "textarea[name=?]", "universal_outer_veil_fate[description]"

      assert_select "textarea[name=?]", "universal_outer_veil_fate[comments]"

      assert_select "input[name=?]", "universal_outer_veil_fate[source]"
    end
  end
end
