require "rails_helper"

RSpec.describe "universal_outer_veil_appearances/edit", type: :view do
  let(:universal_outer_veil_appearance) {
    UniversalOuterVeilAppearance.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:universal_outer_veil_appearance, universal_outer_veil_appearance)
  end

  it "renders the edit universal_outer_veil_appearance form" do
    render

    assert_select "form[action=?][method=?]", universal_outer_veil_appearance_path(universal_outer_veil_appearance), "post" do
      assert_select "input[name=?]", "universal_outer_veil_appearance[name]"

      assert_select "textarea[name=?]", "universal_outer_veil_appearance[description]"

      assert_select "textarea[name=?]", "universal_outer_veil_appearance[comments]"

      assert_select "input[name=?]", "universal_outer_veil_appearance[source]"
    end
  end
end
