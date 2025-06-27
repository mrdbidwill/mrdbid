require "rails_helper"

RSpec.describe "bulb_types/edit", type: :view do
  let(:bulb_type) {
    BulbType.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:bulb_type, bulb_type)
  end

  it "renders the edit bulb_type form" do
    render

    assert_select "form[action=?][method=?]", bulb_type_path(bulb_type), "post" do
      assert_select "input[name=?]", "bulb_type[name]"

      assert_select "textarea[name=?]", "bulb_type[description]"

      assert_select "textarea[name=?]", "bulb_type[comments]"

      assert_select "input[name=?]", "bulb_type[source]"
    end
  end
end
