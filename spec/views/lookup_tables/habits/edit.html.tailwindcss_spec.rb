require "rails_helper"

RSpec.describe "habits/edit", type: :view do
  let(:habit) {
    Habit.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:habit, habit)
  end

  it "renders the edit habit form" do
    render

    assert_select "form[action=?][method=?]", habit_path(habit), "post" do
      assert_select "input[name=?]", "habit[name]"

      assert_select "textarea[name=?]", "habit[description]"

      assert_select "textarea[name=?]", "habit[comments]"

      assert_select "input[name=?]", "habit[source]"
    end
  end
end
