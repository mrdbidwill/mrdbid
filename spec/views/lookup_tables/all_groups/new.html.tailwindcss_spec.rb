require "rails_helper"

RSpec.describe "all_groups/new", type: :view do
  before(:each) do
    assign(:all_group, AllGroup.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new all_group form" do
    render

    assert_select "form[action=?][method=?]", all_groups_path, "post" do
      assert_select "input[name=?]", "all_group[name]"

      assert_select "textarea[name=?]", "all_group[description]"

      assert_select "textarea[name=?]", "all_group[comments]"

      assert_select "input[name=?]", "all_group[source]"
    end
  end
end
