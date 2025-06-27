require "rails_helper"

RSpec.describe "permissions/new", type: :view do
  before(:each) do
    assign(:permission, Permission.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new permission form" do
    render

    assert_select "form[action=?][method=?]", permissions_path, "post" do
      assert_select "input[name=?]", "permission[name]"

      assert_select "textarea[name=?]", "permission[description]"

      assert_select "textarea[name=?]", "permission[comments]"

      assert_select "input[name=?]", "permission[source]"
    end
  end
end
