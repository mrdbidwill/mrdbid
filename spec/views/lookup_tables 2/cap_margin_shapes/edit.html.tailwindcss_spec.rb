require "rails_helper"

RSpec.describe "cap_margin_shapes/edit", type: :view do
  let(:cap_margin_shape) {
    CapMarginShape.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:cap_margin_shape, cap_margin_shape)
  end

  it "renders the edit cap_margin_shape form" do
    render

    assert_select "form[action=?][method=?]", cap_margin_shape_path(cap_margin_shape), "post" do
      assert_select "input[name=?]", "cap_margin_shape[name]"

      assert_select "textarea[name=?]", "cap_margin_shape[description]"

      assert_select "textarea[name=?]", "cap_margin_shape[comments]"

      assert_select "input[name=?]", "cap_margin_shape[source]"
    end
  end
end
