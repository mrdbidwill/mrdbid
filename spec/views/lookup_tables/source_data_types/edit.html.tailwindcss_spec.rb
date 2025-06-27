require "rails_helper"

RSpec.describe "source_data_types/edit", type: :view do
  let(:source_data_type) {
    SourceDataType.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:source_data_type, source_data_type)
  end

  it "renders the edit source_data_type form" do
    render

    assert_select "form[action=?][method=?]", source_data_type_path(source_data_type), "post" do
      assert_select "input[name=?]", "source_data_type[name]"

      assert_select "textarea[name=?]", "source_data_type[description]"

      assert_select "textarea[name=?]", "source_data_type[comments]"

      assert_select "input[name=?]", "source_data_type[source]"
    end
  end
end
