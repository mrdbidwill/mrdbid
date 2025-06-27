require "rails_helper"

RSpec.describe "possible_matches/edit", type: :view do
  let(:possible_match) {
    PossibleMatch.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:possible_match, possible_match)
  end

  it "renders the edit possible_match form" do
    render

    assert_select "form[action=?][method=?]", possible_match_path(possible_match), "post" do
      assert_select "input[name=?]", "possible_match[name]"

      assert_select "textarea[name=?]", "possible_match[description]"

      assert_select "textarea[name=?]", "possible_match[comments]"

      assert_select "input[name=?]", "possible_match[source]"
    end
  end
end
