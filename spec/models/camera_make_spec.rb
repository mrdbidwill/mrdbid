require 'rails_helper'

RSpec.describe CameraMake, type: :model do
  it "validates the presence of a name" do
    camera_make = build(:camera_make, name: nil) # Use FactoryBot
    expect(camera_make).not_to be_valid
    expect(camera_make.errors[:name]).to include("can't be blank")
  end
end
