require "rails_helper"

RSpec.describe "gill_context_flesh_latex_abundances/show", type: :view do
  before(:each) do
    assign(:gill_context_flesh_latex_abundance, GillContextFleshLatexAbundance.create!(
      name: "Name",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
