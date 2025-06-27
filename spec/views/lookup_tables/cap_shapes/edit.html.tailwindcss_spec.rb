require "rails_helper"

RSpec.describe "cap_shapes/edit", type: :view do
  let(:cap_shape) {
    CapShape.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:cap_shape, cap_shape)
  end

  it "renders the edit cap_shape form" do
    render

    assert_select "form[action=?][method=?]", cap_shape_path(cap_shape), "post" do
      assert_select "input[name=?]", "cap_shape[name]"

      assert_select "textarea[name=?]", "cap_shape[description]"

      assert_select "textarea[name=?]", "cap_shape[comments]"

      assert_select "input[name=?]", "cap_shape[source]"
    end
  end
end
