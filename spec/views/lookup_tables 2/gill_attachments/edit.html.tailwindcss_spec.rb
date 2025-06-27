require "rails_helper"

RSpec.describe "gill_attachments/edit", type: :view do
  let(:gill_attachment) {
    GillAttachment.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:gill_attachment, gill_attachment)
  end

  it "renders the edit gill_attachment form" do
    render

    assert_select "form[action=?][method=?]", gill_attachment_path(gill_attachment), "post" do
      assert_select "input[name=?]", "gill_attachment[name]"

      assert_select "textarea[name=?]", "gill_attachment[description]"

      assert_select "textarea[name=?]", "gill_attachment[comments]"

      assert_select "input[name=?]", "gill_attachment[source]"
    end
  end
end
