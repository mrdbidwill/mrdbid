require "rails_helper"

RSpec.describe "abundances/edit", type: :view do
  let(:abundance) {
    Abundance.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:abundance, abundance)
  end

  it "renders the edit abundance form" do
    render

    assert_select "form[action=?][method=?]", abundance_path(abundance), "post" do
      assert_select "input[name=?]", "abundance[name]"

      assert_select "textarea[name=?]", "abundance[description]"

      assert_select "textarea[name=?]", "abundance[comments]"

      assert_select "input[name=?]", "abundance[source]"
    end
  end
end
