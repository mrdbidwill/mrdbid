require "rails_helper"

RSpec.describe "synonyms/new", type: :view do
  before(:each) do
    assign(:synonym, Synonym.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new synonym form" do
    render

    assert_select "form[action=?][method=?]", synonyms_path, "post" do
      assert_select "input[name=?]", "synonym[name]"

      assert_select "textarea[name=?]", "synonym[description]"

      assert_select "textarea[name=?]", "synonym[comments]"

      assert_select "input[name=?]", "synonym[source]"
    end
  end
end
