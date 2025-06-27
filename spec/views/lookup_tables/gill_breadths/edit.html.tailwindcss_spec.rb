require "rails_helper"

RSpec.describe "gill_breadths/edit", type: :view do
  let(:gill_breadth) {
    GillBreadth.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:gill_breadth, gill_breadth)
  end

  it "renders the edit gill_breadth form" do
    render

    assert_select "form[action=?][method=?]", gill_breadth_path(gill_breadth), "post" do
      assert_select "input[name=?]", "gill_breadth[name]"

      assert_select "textarea[name=?]", "gill_breadth[description]"

      assert_select "textarea[name=?]", "gill_breadth[comments]"

      assert_select "input[name=?]", "gill_breadth[source]"
    end
  end
end
