require "rails_helper"

RSpec.describe "toxics/new", type: :view do
  before(:each) do
    assign(:toxic, Toxic.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new toxic form" do
    render

    assert_select "form[action=?][method=?]", toxics_path, "post" do
      assert_select "input[name=?]", "toxic[name]"

      assert_select "textarea[name=?]", "toxic[description]"

      assert_select "textarea[name=?]", "toxic[comments]"

      assert_select "input[name=?]", "toxic[source]"
    end
  end
end
