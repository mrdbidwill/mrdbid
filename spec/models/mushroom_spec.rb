require 'rails_helper'

RSpec.describe Mushroom, type: :model do
  it "is valid with valid attributes" do
    mushroom = FactoryBot.create(:mushroom)
    expect(mushroom).to be_valid
  end

  it "is not valid without a mushroom_name" do
    mushroom = FactoryBot.build(:mushroom, mushroom_name: nil)  # Note use of build here
    expect(mushroom).not_to be_valid
  end
end
