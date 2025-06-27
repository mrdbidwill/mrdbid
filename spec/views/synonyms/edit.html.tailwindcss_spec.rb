require "rails_helper"

RSpec.describe "synonyms/edit", type: :view do
  let(:synonym) {
    Synonym.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:synonym, synonym)
  end

  it "renders the edit synonym form" do
    render

    assert_select "form[action=?][method=?]", synonym_path(synonym), "post" do
      assert_select "input[name=?]", "synonym[name]"

      assert_select "textarea[name=?]", "synonym[description]"

      assert_select "textarea[name=?]", "synonym[comments]"

      assert_select "input[name=?]", "synonym[source]"
    end
  end
end
