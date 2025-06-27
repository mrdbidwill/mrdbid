require "rails_helper"

RSpec.describe "gill_thicknesses/new", type: :view do
  before(:each) do
    assign(:gill_thickness, GillThickness.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new gill_thickness form" do
    render

    assert_select "form[action=?][method=?]", gill_thicknesses_path, "post" do
      assert_select "input[name=?]", "gill_thickness[name]"

      assert_select "textarea[name=?]", "gill_thickness[description]"

      assert_select "textarea[name=?]", "gill_thickness[comments]"

      assert_select "input[name=?]", "gill_thickness[source]"
    end
  end
end
