require "rails_helper"

RSpec.describe "habitats/new", type: :view do
  before(:each) do
    assign(:habitat, Habitat.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new habitat form" do
    render

    assert_select "form[action=?][method=?]", habitats_path, "post" do
      assert_select "input[name=?]", "habitat[name]"

      assert_select "textarea[name=?]", "habitat[description]"

      assert_select "textarea[name=?]", "habitat[comments]"

      assert_select "input[name=?]", "habitat[source]"
    end
  end
end
