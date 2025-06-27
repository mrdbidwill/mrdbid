require "rails_helper"

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        title: "Title",
        author: "Author",
        ref: "Ref",
        item_code: "Item Code",
        comment: "MyText",
        my_rating: 2,
        my_comment: "MyText"
      ),
      Article.create!(
        title: "Title",
        author: "Author",
        ref: "Ref",
        item_code: "Item Code",
        comment: "MyText",
        my_rating: 2,
        my_comment: "MyText"
      )
    ])
  end

  it "renders a list of articles" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Title"), count: 2
    assert_select cell_selector, text: Regexp.new("Author"), count: 2
    assert_select cell_selector, text: Regexp.new("Ref"), count: 2
    assert_select cell_selector, text: Regexp.new("Item Code"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
  end
end
