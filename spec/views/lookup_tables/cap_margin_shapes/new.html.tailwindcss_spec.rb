require "rails_helper"

RSpec.describe "cap_margin_shapes/new", type: :view do
  before(:each) do
    assign(:cap_margin_shape, CapMarginShape.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new cap_margin_shape form" do
    render

    assert_select "form[action=?][method=?]", cap_margin_shapes_path, "post" do
      assert_select "input[name=?]", "cap_margin_shape[name]"

      assert_select "textarea[name=?]", "cap_margin_shape[description]"

      assert_select "textarea[name=?]", "cap_margin_shape[comments]"

      assert_select "input[name=?]", "cap_margin_shape[source]"
    end
  end
end
