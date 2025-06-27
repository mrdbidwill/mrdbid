require "rails_helper"

RSpec.describe "soil_types/edit", type: :view do
  let(:soil_type) {
    SoilType.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:soil_type, soil_type)
  end

  it "renders the edit soil_type form" do
    render

    assert_select "form[action=?][method=?]", soil_type_path(soil_type), "post" do
      assert_select "input[name=?]", "soil_type[name]"

      assert_select "textarea[name=?]", "soil_type[description]"

      assert_select "textarea[name=?]", "soil_type[comments]"

      assert_select "input[name=?]", "soil_type[source]"
    end
  end
end
