require "rails_helper"

RSpec.describe "epithets/new", type: :view do
  before(:each) do
    assign(:epithet, Epithet.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new epithet form" do
    render

    assert_select "form[action=?][method=?]", epithets_path, "post" do
      assert_select "input[name=?]", "epithet[name]"

      assert_select "textarea[name=?]", "epithet[description]"

      assert_select "textarea[name=?]", "epithet[comments]"

      assert_select "input[name=?]", "epithet[source]"
    end
  end
end
