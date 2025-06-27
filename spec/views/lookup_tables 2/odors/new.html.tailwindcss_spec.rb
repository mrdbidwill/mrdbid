require "rails_helper"

RSpec.describe "odors/new", type: :view do
  before(:each) do
    assign(:odor, Odor.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new odor form" do
    render

    assert_select "form[action=?][method=?]", odors_path, "post" do
      assert_select "input[name=?]", "odor[name]"

      assert_select "textarea[name=?]", "odor[description]"

      assert_select "textarea[name=?]", "odor[comments]"

      assert_select "input[name=?]", "odor[source]"
    end
  end
end
