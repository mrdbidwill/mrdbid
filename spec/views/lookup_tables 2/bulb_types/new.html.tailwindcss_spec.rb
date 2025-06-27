require "rails_helper"

RSpec.describe "bulb_types/new", type: :view do
  before(:each) do
    assign(:bulb_type, BulbType.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new bulb_type form" do
    render

    assert_select "form[action=?][method=?]", bulb_types_path, "post" do
      assert_select "input[name=?]", "bulb_type[name]"

      assert_select "textarea[name=?]", "bulb_type[description]"

      assert_select "textarea[name=?]", "bulb_type[comments]"

      assert_select "input[name=?]", "bulb_type[source]"
    end
  end
end
