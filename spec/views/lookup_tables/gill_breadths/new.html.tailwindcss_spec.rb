require "rails_helper"

RSpec.describe "gill_breadths/new", type: :view do
  before(:each) do
    assign(:gill_breadth, GillBreadth.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new gill_breadth form" do
    render

    assert_select "form[action=?][method=?]", gill_breadths_path, "post" do
      assert_select "input[name=?]", "gill_breadth[name]"

      assert_select "textarea[name=?]", "gill_breadth[description]"

      assert_select "textarea[name=?]", "gill_breadth[comments]"

      assert_select "input[name=?]", "gill_breadth[source]"
    end
  end
end
