require "rails_helper"

RSpec.describe "partial_inner_veil_appearances/edit", type: :view do
  let(:partial_inner_veil_appearance) {
    PartialInnerVeilAppearance.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:partial_inner_veil_appearance, partial_inner_veil_appearance)
  end

  it "renders the edit partial_inner_veil_appearance form" do
    render

    assert_select "form[action=?][method=?]", partial_inner_veil_appearance_path(partial_inner_veil_appearance), "post" do
      assert_select "input[name=?]", "partial_inner_veil_appearance[name]"

      assert_select "textarea[name=?]", "partial_inner_veil_appearance[description]"

      assert_select "textarea[name=?]", "partial_inner_veil_appearance[comments]"

      assert_select "input[name=?]", "partial_inner_veil_appearance[source]"
    end
  end
end
