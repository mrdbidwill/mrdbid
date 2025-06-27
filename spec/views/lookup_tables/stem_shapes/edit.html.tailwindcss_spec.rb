require "rails_helper"

RSpec.describe "stem_shapes/edit", type: :view do
  let(:stem_shape) {
    StemShape.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:stem_shape, stem_shape)
  end

  it "renders the edit stem_shape form" do
    render

    assert_select "form[action=?][method=?]", stem_shape_path(stem_shape), "post" do
      assert_select "input[name=?]", "stem_shape[name]"

      assert_select "textarea[name=?]", "stem_shape[description]"

      assert_select "textarea[name=?]", "stem_shape[comments]"

      assert_select "input[name=?]", "stem_shape[source]"
    end
  end
end
