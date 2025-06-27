require "rails_helper"

RSpec.describe "gill_attachments/new", type: :view do
  before(:each) do
    assign(:gill_attachment, GillAttachment.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new gill_attachment form" do
    render

    assert_select "form[action=?][method=?]", gill_attachments_path, "post" do
      assert_select "input[name=?]", "gill_attachment[name]"

      assert_select "textarea[name=?]", "gill_attachment[description]"

      assert_select "textarea[name=?]", "gill_attachment[comments]"

      assert_select "input[name=?]", "gill_attachment[source]"
    end
  end
end
