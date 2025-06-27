require "rails_helper"

RSpec.describe "gill_thicknesses/edit", type: :view do
  let(:gill_thickness) {
    GillThickness.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:gill_thickness, gill_thickness)
  end

  it "renders the edit gill_thickness form" do
    render

    assert_select "form[action=?][method=?]", gill_thickness_path(gill_thickness), "post" do
      assert_select "input[name=?]", "gill_thickness[name]"

      assert_select "textarea[name=?]", "gill_thickness[description]"

      assert_select "textarea[name=?]", "gill_thickness[comments]"

      assert_select "input[name=?]", "gill_thickness[source]"
    end
  end
end
