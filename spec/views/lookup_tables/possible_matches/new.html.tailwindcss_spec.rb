require "rails_helper"

RSpec.describe "possible_matches/new", type: :view do
  before(:each) do
    assign(:possible_match, PossibleMatch.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new possible_match form" do
    render

    assert_select "form[action=?][method=?]", possible_matches_path, "post" do
      assert_select "input[name=?]", "possible_match[name]"

      assert_select "textarea[name=?]", "possible_match[description]"

      assert_select "textarea[name=?]", "possible_match[comments]"

      assert_select "input[name=?]", "possible_match[source]"
    end
  end
end
