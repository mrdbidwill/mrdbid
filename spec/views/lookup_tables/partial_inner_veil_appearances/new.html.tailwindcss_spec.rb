require "rails_helper"

RSpec.describe "partial_inner_veil_appearances/new", type: :view do
  before(:each) do
    assign(:partial_inner_veil_appearance, PartialInnerVeilAppearance.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new partial_inner_veil_appearance form" do
    render

    assert_select "form[action=?][method=?]", partial_inner_veil_appearances_path, "post" do
      assert_select "input[name=?]", "partial_inner_veil_appearance[name]"

      assert_select "textarea[name=?]", "partial_inner_veil_appearance[description]"

      assert_select "textarea[name=?]", "partial_inner_veil_appearance[comments]"

      assert_select "input[name=?]", "partial_inner_veil_appearance[source]"
    end
  end
end
