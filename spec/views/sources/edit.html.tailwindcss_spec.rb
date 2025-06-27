require "rails_helper"

RSpec.describe "sources/edit", type: :view do
  let(:source) {
    Source.create!(
      title: "MyString",
      author: "MyString",
      ref: "MyString",
      item_code: "MyString",
      comment: "MyText",
      my_rating: 1,
      my_comment: "MyText"
    )
  }

  before(:each) do
    assign(:source, source)
  end

  it "renders the edit source form" do
    render

    assert_select "form[action=?][method=?]", source_path(source), "post" do
      assert_select "input[name=?]", "source[title]"

      assert_select "input[name=?]", "source[author]"

      assert_select "input[name=?]", "source[ref]"

      assert_select "input[name=?]", "source[item_code]"

      assert_select "textarea[name=?]", "source[comment]"

      assert_select "input[name=?]", "source[my_rating]"

      assert_select "textarea[name=?]", "source[my_comment]"
    end
  end
end
