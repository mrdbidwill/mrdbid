require "rails_helper"

RSpec.describe "fungus_types/edit", type: :view do
  let(:fungus_type) {
    FungusType.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:fungus_type, fungus_type)
  end

  it "renders the edit fungus_type form" do
    render

    assert_select "form[action=?][method=?]", fungus_type_path(fungus_type), "post" do
      assert_select "input[name=?]", "fungus_type[name]"

      assert_select "textarea[name=?]", "fungus_type[description]"

      assert_select "textarea[name=?]", "fungus_type[comments]"

      assert_select "input[name=?]", "fungus_type[source]"
    end
  end
end
