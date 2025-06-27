require "rails_helper"

RSpec.describe "gill_context_flesh_latex_abundances/new", type: :view do
  before(:each) do
    assign(:gill_context_flesh_latex_abundance, GillContextFleshLatexAbundance.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new gill_context_flesh_latex_abundance form" do
    render

    assert_select "form[action=?][method=?]", gill_context_flesh_latex_abundances_path, "post" do
      assert_select "input[name=?]", "gill_context_flesh_latex_abundance[name]"

      assert_select "textarea[name=?]", "gill_context_flesh_latex_abundance[description]"

      assert_select "textarea[name=?]", "gill_context_flesh_latex_abundance[comments]"

      assert_select "input[name=?]", "gill_context_flesh_latex_abundance[source]"
    end
  end
end
