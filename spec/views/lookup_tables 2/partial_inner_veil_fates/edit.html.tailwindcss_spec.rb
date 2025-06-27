require "rails_helper"

RSpec.describe "partial_inner_veil_fates/edit", type: :view do
  let(:partial_inner_veil_fate) {
    PartialInnerVeilFate.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:partial_inner_veil_fate, partial_inner_veil_fate)
  end

  it "renders the edit partial_inner_veil_fate form" do
    render

    assert_select "form[action=?][method=?]", partial_inner_veil_fate_path(partial_inner_veil_fate), "post" do
      assert_select "input[name=?]", "partial_inner_veil_fate[name]"

      assert_select "textarea[name=?]", "partial_inner_veil_fate[description]"

      assert_select "textarea[name=?]", "partial_inner_veil_fate[comments]"

      assert_select "input[name=?]", "partial_inner_veil_fate[source]"
    end
  end
end
