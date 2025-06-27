require "rails_helper"

RSpec.describe "cap_shapes/new", type: :view do
  before(:each) do
    assign(:cap_shape, CapShape.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new cap_shape form" do
    render

    assert_select "form[action=?][method=?]", cap_shapes_path, "post" do
      assert_select "input[name=?]", "cap_shape[name]"

      assert_select "textarea[name=?]", "cap_shape[description]"

      assert_select "textarea[name=?]", "cap_shape[comments]"

      assert_select "input[name=?]", "cap_shape[source]"
    end
  end
end
