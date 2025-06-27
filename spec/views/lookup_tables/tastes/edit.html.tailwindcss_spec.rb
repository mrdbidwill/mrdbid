require "rails_helper"

RSpec.describe "tastes/edit", type: :view do
  let(:taste) {
    Taste.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:taste, taste)
  end

  it "renders the edit taste form" do
    render

    assert_select "form[action=?][method=?]", taste_path(taste), "post" do
      assert_select "input[name=?]", "taste[name]"

      assert_select "textarea[name=?]", "taste[description]"

      assert_select "textarea[name=?]", "taste[comments]"

      assert_select "input[name=?]", "taste[source]"
    end
  end
end
