require "rails_helper"

RSpec.describe "gill_context_flesh_latex_abundances/edit", type: :view do
  let(:gill_context_flesh_latex_abundance) {
    GillContextFleshLatexAbundance.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:gill_context_flesh_latex_abundance, gill_context_flesh_latex_abundance)
  end

  it "renders the edit gill_context_flesh_latex_abundance form" do
    render

    assert_select "form[action=?][method=?]", gill_context_flesh_latex_abundance_path(gill_context_flesh_latex_abundance), "post" do
      assert_select "input[name=?]", "gill_context_flesh_latex_abundance[name]"

      assert_select "textarea[name=?]", "gill_context_flesh_latex_abundance[description]"

      assert_select "textarea[name=?]", "gill_context_flesh_latex_abundance[comments]"

      assert_select "input[name=?]", "gill_context_flesh_latex_abundance[source]"
    end
  end
end
