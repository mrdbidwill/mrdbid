require "rails_helper"

RSpec.describe "veils/new", type: :view do
  before(:each) do
    assign(:veil, Veil.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new veil form" do
    render

    assert_select "form[action=?][method=?]", veils_path, "post" do
      assert_select "input[name=?]", "veil[name]"

      assert_select "textarea[name=?]", "veil[description]"

      assert_select "textarea[name=?]", "veil[comments]"

      assert_select "input[name=?]", "veil[source]"
    end
  end
end
