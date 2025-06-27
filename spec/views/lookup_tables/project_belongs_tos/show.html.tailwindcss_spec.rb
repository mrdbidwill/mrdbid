require "rails_helper"

RSpec.describe "project_belongs_tos/show", type: :view do
  before(:each) do
    assign(:project_belongs_to, ProjectBelongsTo.create!(
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
