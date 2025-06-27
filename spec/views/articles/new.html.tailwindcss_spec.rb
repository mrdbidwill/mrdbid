require "rails_helper"

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      title: "MyString",
      author: "MyString",
      ref: "MyString",
      item_code: "MyString",
      comment: "MyText",
      my_rating: 1,
      my_comment: "MyText"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do
      assert_select "input[name=?]", "article[title]"

      assert_select "input[name=?]", "article[author]"

      assert_select "input[name=?]", "article[ref]"

      assert_select "input[name=?]", "article[item_code]"

      assert_select "textarea[name=?]", "article[comment]"

      assert_select "input[name=?]", "article[my_rating]"

      assert_select "textarea[name=?]", "article[my_comment]"
    end
  end
end
