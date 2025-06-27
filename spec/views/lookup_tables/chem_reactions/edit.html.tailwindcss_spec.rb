require "rails_helper"

RSpec.describe "chem_reactions/edit", type: :view do
  let(:chem_reaction) {
    ChemReaction.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:chem_reaction, chem_reaction)
  end

  it "renders the edit chem_reaction form" do
    render

    assert_select "form[action=?][method=?]", chem_reaction_path(chem_reaction), "post" do
      assert_select "input[name=?]", "chem_reaction[name]"

      assert_select "textarea[name=?]", "chem_reaction[description]"

      assert_select "textarea[name=?]", "chem_reaction[comments]"

      assert_select "input[name=?]", "chem_reaction[source]"
    end
  end
end
