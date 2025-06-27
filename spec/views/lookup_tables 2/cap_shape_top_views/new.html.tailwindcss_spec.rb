require "rails_helper"

RSpec.describe "cap_shape_top_views/new", type: :view do
  before(:each) do
    assign(:cap_shape_top_view, CapShapeTopView.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new cap_shape_top_view form" do
    render

    assert_select "form[action=?][method=?]", cap_shape_top_views_path, "post" do
      assert_select "input[name=?]", "cap_shape_top_view[name]"

      assert_select "textarea[name=?]", "cap_shape_top_view[description]"

      assert_select "textarea[name=?]", "cap_shape_top_view[comments]"

      assert_select "input[name=?]", "cap_shape_top_view[source]"
    end
  end
end
