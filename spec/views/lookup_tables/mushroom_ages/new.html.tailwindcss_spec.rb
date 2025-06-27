require "rails_helper"

RSpec.describe "mushroom_ages/new", type: :view do
  before(:each) do
    assign(:mushroom_age, MushroomAge.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new mushroom_age form" do
    render

    assert_select "form[action=?][method=?]", mushroom_ages_path, "post" do
      assert_select "input[name=?]", "mushroom_age[name]"

      assert_select "textarea[name=?]", "mushroom_age[description]"

      assert_select "textarea[name=?]", "mushroom_age[comments]"

      assert_select "input[name=?]", "mushroom_age[source]"
    end
  end
end
