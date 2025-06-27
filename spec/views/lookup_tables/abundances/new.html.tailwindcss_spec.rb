require "rails_helper"

RSpec.describe "abundances/new", type: :view do
  before(:each) do
    assign(:abundance, Abundance.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new abundance form" do
    render

    assert_select "form[action=?][method=?]", abundances_path, "post" do
      assert_select "input[name=?]", "abundance[name]"

      assert_select "textarea[name=?]", "abundance[description]"

      assert_select "textarea[name=?]", "abundance[comments]"

      assert_select "input[name=?]", "abundance[source]"
    end
  end
end
