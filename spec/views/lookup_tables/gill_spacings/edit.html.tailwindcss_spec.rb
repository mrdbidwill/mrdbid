require "rails_helper"

RSpec.describe "gill_spacings/edit", type: :view do
  let(:gill_spacing) {
    GillSpacing.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:gill_spacing, gill_spacing)
  end

  it "renders the edit gill_spacing form" do
    render

    assert_select "form[action=?][method=?]", gill_spacing_path(gill_spacing), "post" do
      assert_select "input[name=?]", "gill_spacing[name]"

      assert_select "textarea[name=?]", "gill_spacing[description]"

      assert_select "textarea[name=?]", "gill_spacing[comments]"

      assert_select "input[name=?]", "gill_spacing[source]"
    end
  end
end
