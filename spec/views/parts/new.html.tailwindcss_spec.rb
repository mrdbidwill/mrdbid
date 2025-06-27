require "rails_helper"

RSpec.describe "parts/new", type: :view do
  before(:each) do
    assign(:part, Part.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new part form" do
    render

    assert_select "form[action=?][method=?]", parts_path, "post" do
      assert_select "input[name=?]", "part[name]"

      assert_select "textarea[name=?]", "part[description]"

      assert_select "textarea[name=?]", "part[comments]"

      assert_select "input[name=?]", "part[source]"
    end
  end
end
