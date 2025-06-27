require "rails_helper"

RSpec.describe "cap_margin_types/new", type: :view do
  before(:each) do
    assign(:cap_margin_type, CapMarginType.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new cap_margin_type form" do
    render

    assert_select "form[action=?][method=?]", cap_margin_types_path, "post" do
      assert_select "input[name=?]", "cap_margin_type[name]"

      assert_select "textarea[name=?]", "cap_margin_type[description]"

      assert_select "textarea[name=?]", "cap_margin_type[comments]"

      assert_select "input[name=?]", "cap_margin_type[source]"
    end
  end
end
