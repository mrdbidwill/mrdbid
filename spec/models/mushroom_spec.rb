require 'rails_helper'

RSpec.describe Mushroom, type: :model do
  let(:user) { create(:user) } # Create a user for testing
  let(:mushroom) { build(:mushroom, user: user) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(mushroom).to be_valid
    end

    it 'is invalid without a name' do
      mushroom.name = nil
      expect(mushroom).not_to be_valid
      expect(mushroom.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a user' do
      mushroom.user = nil
      expect(mushroom).not_to be_valid
      expect(mushroom.errors[:user]).to include("must exist", "can't be blank")
    end
  end

  context 'associations' do
    it 'belongs to a user' do
      expect(mushroom.user).to eq(user)
    end

    it 'has many mr_character_mushrooms and mr_characters through mr_character_mushrooms' do
      assoc = Mushroom.reflect_on_association(:mr_characters)
      expect(assoc.macro).to eq(:has_many)
      expect(assoc.options[:through]).to eq(:mr_character_mushrooms)
    end
  end
end


