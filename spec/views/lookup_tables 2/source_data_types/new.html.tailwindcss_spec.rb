require "rails_helper"

RSpec.describe "source_data_types/new", type: :view do
  before(:each) do
    assign(:source_data_type, SourceDataType.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new source_data_type form" do
    render

    assert_select "form[action=?][method=?]", source_data_types_path, "post" do
      assert_select "input[name=?]", "source_data_type[name]"

      assert_select "textarea[name=?]", "source_data_type[description]"

      assert_select "textarea[name=?]", "source_data_type[comments]"

      assert_select "input[name=?]", "source_data_type[source]"
    end
  end
end
