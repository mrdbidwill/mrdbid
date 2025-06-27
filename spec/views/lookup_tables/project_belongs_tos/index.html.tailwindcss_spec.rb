require "rails_helper"

RSpec.describe "project_belongs_tos/index", type: :view do
  before(:each) do
    assign(:project_belongs_tos, [
      ProjectBelongsTo.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      ProjectBelongsTo.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of project_belongs_tos" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
