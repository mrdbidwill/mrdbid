require "rails_helper"

RSpec.describe "roles/index", type: :view do
  before(:each) do
    assign(:roles, [
      Role.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText"
      ),
      Role.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText"
      )
    ])
  end

  it "renders a list of roles" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
  end
end
