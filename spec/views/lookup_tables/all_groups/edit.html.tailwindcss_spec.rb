require "rails_helper"

RSpec.describe "all_groups/edit", type: :view do
  let(:all_group) {
    AllGroup.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:all_group, all_group)
  end

  it "renders the edit all_group form" do
    render

    assert_select "form[action=?][method=?]", all_group_path(all_group), "post" do
      assert_select "input[name=?]", "all_group[name]"

      assert_select "textarea[name=?]", "all_group[description]"

      assert_select "textarea[name=?]", "all_group[comments]"

      assert_select "input[name=?]", "all_group[source]"
    end
  end
end
