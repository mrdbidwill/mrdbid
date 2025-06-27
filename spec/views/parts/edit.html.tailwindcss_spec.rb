require "rails_helper"

RSpec.describe "parts/edit", type: :view do
  let(:part) {
    Part.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:part, part)
  end

  it "renders the edit part form" do
    render

    assert_select "form[action=?][method=?]", part_path(part), "post" do
      assert_select "input[name=?]", "part[name]"

      assert_select "textarea[name=?]", "part[description]"

      assert_select "textarea[name=?]", "part[comments]"

      assert_select "input[name=?]", "part[source]"
    end
  end
end
