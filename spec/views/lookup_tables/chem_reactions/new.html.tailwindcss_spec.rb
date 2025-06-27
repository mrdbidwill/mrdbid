require "rails_helper"

RSpec.describe "chem_reactions/new", type: :view do
  before(:each) do
    assign(:chem_reaction, ChemReaction.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new chem_reaction form" do
    render

    assert_select "form[action=?][method=?]", chem_reactions_path, "post" do
      assert_select "input[name=?]", "chem_reaction[name]"

      assert_select "textarea[name=?]", "chem_reaction[description]"

      assert_select "textarea[name=?]", "chem_reaction[comments]"

      assert_select "input[name=?]", "chem_reaction[source]"
    end
  end
end
