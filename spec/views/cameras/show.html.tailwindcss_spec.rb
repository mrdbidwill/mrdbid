require "rails_helper"

RSpec.describe "cameras/show", type: :view do
  before(:each) do
    assign(:camera, Camera.create!(
      name: "Name",
      description: "MyText",
      comments: "MyText",
      camera_makes: nil,
      camera_models: nil,
      lens: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
