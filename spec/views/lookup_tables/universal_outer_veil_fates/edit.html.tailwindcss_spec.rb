require "rails_helper"

RSpec.describe "universal_outer_veil_fates/edit", type: :view do
  let(:universal_outer_veil_fate) {
    UniversalOuterVeilFate.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:universal_outer_veil_fate, universal_outer_veil_fate)
  end

  it "renders the edit universal_outer_veil_fate form" do
    render

    assert_select "form[action=?][method=?]", universal_outer_veil_fate_path(universal_outer_veil_fate), "post" do
      assert_select "input[name=?]", "universal_outer_veil_fate[name]"

      assert_select "textarea[name=?]", "universal_outer_veil_fate[description]"

      assert_select "textarea[name=?]", "universal_outer_veil_fate[comments]"

      assert_select "input[name=?]", "universal_outer_veil_fate[source]"
    end
  end
end
