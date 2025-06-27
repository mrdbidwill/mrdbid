require "rails_helper"

RSpec.describe "sources/show", type: :view do
  before(:each) do
    assign(:source, Source.create!(
      title: "Title",
      author: "Author",
      ref: "Ref",
      item_code: "Item Code",
      comment: "MyText",
      my_rating: 2,
      my_comment: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Ref/)
    expect(rendered).to match(/Item Code/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
