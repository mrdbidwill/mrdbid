require "rails_helper"

RSpec.describe "fungus_types/new", type: :view do
  before(:each) do
    assign(:fungus_type, FungusType.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new fungus_type form" do
    render

    assert_select "form[action=?][method=?]", fungus_types_path, "post" do
      assert_select "input[name=?]", "fungus_type[name]"

      assert_select "textarea[name=?]", "fungus_type[description]"

      assert_select "textarea[name=?]", "fungus_type[comments]"

      assert_select "input[name=?]", "fungus_type[source]"
    end
  end
end
