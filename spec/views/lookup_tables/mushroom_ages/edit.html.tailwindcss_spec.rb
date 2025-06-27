require "rails_helper"

RSpec.describe "mushroom_ages/edit", type: :view do
  let(:mushroom_age) {
    MushroomAge.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:mushroom_age, mushroom_age)
  end

  it "renders the edit mushroom_age form" do
    render

    assert_select "form[action=?][method=?]", mushroom_age_path(mushroom_age), "post" do
      assert_select "input[name=?]", "mushroom_age[name]"

      assert_select "textarea[name=?]", "mushroom_age[description]"

      assert_select "textarea[name=?]", "mushroom_age[comments]"

      assert_select "input[name=?]", "mushroom_age[source]"
    end
  end
end
