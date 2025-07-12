# spec/factories/lookup_items.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :lookup_item do
    name { "Generic Lookup Item" }
    description { "A generic lookup item for testing" }
  end

  factory :display_option, class: 'DisplayOption' do
    name { "Text Field" }
    description { "A text field input" }
  end

  factory :part, class: 'Part' do
    name { "Cap" }
    description { "The mushroom cap" }
  end

  factory :country, class: 'Country' do
    name { "United States" }
  end

  factory :fungus_type, class: 'FungusType' do
    name { "Basidiomycota" }
  end

  factory :mushroom_storage_location, class: 'MushroomStorageLocation' do
    name { "Dry Storage" }
  end
end




