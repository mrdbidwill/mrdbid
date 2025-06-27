require "rails_helper"

RSpec.describe "source_data_types/index", type: :view do
  before(:each) do
    assign(:source_data_types, [
      SourceDataType.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      SourceDataType.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of source_data_types" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
