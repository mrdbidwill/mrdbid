# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mushroom, type: :model do
  it "is valid with a name, description, and user" do
    user = FactoryBot.create(:user)
    mushroom = FactoryBot.build(:mushroom, name: "Test Mushroom", description: "Test Description", user: user)
    expect(mushroom).to be_valid
  end
end

