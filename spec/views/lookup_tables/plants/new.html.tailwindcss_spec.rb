require "rails_helper"

RSpec.describe "plants/new", type: :view do
  before(:each) do
    assign(:plant, Plant.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new plant form" do
    render

    assert_select "form[action=?][method=?]", plants_path, "post" do
      assert_select "input[name=?]", "plant[name]"

      assert_select "textarea[name=?]", "plant[description]"

      assert_select "textarea[name=?]", "plant[comments]"

      assert_select "input[name=?]", "plant[source]"
    end
  end
end
