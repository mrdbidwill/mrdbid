require "rails_helper"

RSpec.describe "habitats/edit", type: :view do
  let(:habitat) {
    Habitat.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:habitat, habitat)
  end

  it "renders the edit habitat form" do
    render

    assert_select "form[action=?][method=?]", habitat_path(habitat), "post" do
      assert_select "input[name=?]", "habitat[name]"

      assert_select "textarea[name=?]", "habitat[description]"

      assert_select "textarea[name=?]", "habitat[comments]"

      assert_select "input[name=?]", "habitat[source]"
    end
  end
end
