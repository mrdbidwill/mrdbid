require "rails_helper"

RSpec.describe "cap_shape_top_views/edit", type: :view do
  let(:cap_shape_top_view) {
    CapShapeTopView.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:cap_shape_top_view, cap_shape_top_view)
  end

  it "renders the edit cap_shape_top_view form" do
    render

    assert_select "form[action=?][method=?]", cap_shape_top_view_path(cap_shape_top_view), "post" do
      assert_select "input[name=?]", "cap_shape_top_view[name]"

      assert_select "textarea[name=?]", "cap_shape_top_view[description]"

      assert_select "textarea[name=?]", "cap_shape_top_view[comments]"

      assert_select "input[name=?]", "cap_shape_top_view[source]"
    end
  end
end
