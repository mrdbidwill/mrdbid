require "rails_helper"

RSpec.describe "cap_margin_types/edit", type: :view do
  let(:cap_margin_type) {
    CapMarginType.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:cap_margin_type, cap_margin_type)
  end

  it "renders the edit cap_margin_type form" do
    render

    assert_select "form[action=?][method=?]", cap_margin_type_path(cap_margin_type), "post" do
      assert_select "input[name=?]", "cap_margin_type[name]"

      assert_select "textarea[name=?]", "cap_margin_type[description]"

      assert_select "textarea[name=?]", "cap_margin_type[comments]"

      assert_select "input[name=?]", "cap_margin_type[source]"
    end
  end
end
