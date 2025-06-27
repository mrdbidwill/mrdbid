require "rails_helper"

RSpec.describe "stem_shapes/new", type: :view do
  before(:each) do
    assign(:stem_shape, StemShape.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new stem_shape form" do
    render

    assert_select "form[action=?][method=?]", stem_shapes_path, "post" do
      assert_select "input[name=?]", "stem_shape[name]"

      assert_select "textarea[name=?]", "stem_shape[description]"

      assert_select "textarea[name=?]", "stem_shape[comments]"

      assert_select "input[name=?]", "stem_shape[source]"
    end
  end
end
