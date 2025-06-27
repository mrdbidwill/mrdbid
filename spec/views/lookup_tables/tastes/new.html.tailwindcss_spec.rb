require "rails_helper"

RSpec.describe "tastes/new", type: :view do
  before(:each) do
    assign(:taste, Taste.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new taste form" do
    render

    assert_select "form[action=?][method=?]", tastes_path, "post" do
      assert_select "input[name=?]", "taste[name]"

      assert_select "textarea[name=?]", "taste[description]"

      assert_select "textarea[name=?]", "taste[comments]"

      assert_select "input[name=?]", "taste[source]"
    end
  end
end
