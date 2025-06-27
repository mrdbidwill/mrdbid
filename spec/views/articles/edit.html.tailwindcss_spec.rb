require "rails_helper"

RSpec.describe "articles/edit", type: :view do
  let(:article) {
    Article.create!(
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
    assign(:article, article)
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(article), "post" do
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
