require "rails_helper"

RSpec.describe "gill_spacings/new", type: :view do
  before(:each) do
    assign(:gill_spacing, GillSpacing.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new gill_spacing form" do
    render

    assert_select "form[action=?][method=?]", gill_spacings_path, "post" do
      assert_select "input[name=?]", "gill_spacing[name]"

      assert_select "textarea[name=?]", "gill_spacing[description]"

      assert_select "textarea[name=?]", "gill_spacing[comments]"

      assert_select "input[name=?]", "gill_spacing[source]"
    end
  end
end
