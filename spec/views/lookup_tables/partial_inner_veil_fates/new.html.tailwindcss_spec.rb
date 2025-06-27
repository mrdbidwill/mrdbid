require "rails_helper"

RSpec.describe "partial_inner_veil_fates/new", type: :view do
  before(:each) do
    assign(:partial_inner_veil_fate, PartialInnerVeilFate.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new partial_inner_veil_fate form" do
    render

    assert_select "form[action=?][method=?]", partial_inner_veil_fates_path, "post" do
      assert_select "input[name=?]", "partial_inner_veil_fate[name]"

      assert_select "textarea[name=?]", "partial_inner_veil_fate[description]"

      assert_select "textarea[name=?]", "partial_inner_veil_fate[comments]"

      assert_select "input[name=?]", "partial_inner_veil_fate[source]"
    end
  end
end
