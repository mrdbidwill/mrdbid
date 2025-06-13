FactoryBot.define do
  factory :mushroom do
    mushroom_name { "Fly Agaric" }
    common_name { "Amanita muscaria" }
    description { "A highly toxic yet iconic mushroom." }
    comment { "Found under a birch tree." }
    location_found_city { "Mystic Grove" }
    location_found_county { "Fairy County" }
    location_public { false }
    share_data { false }
    date_found { "2025-06-05" }
    mushroom_location { association :mushroom_location }
    state { association :state }
    country { association :country }
    fungus_type { association :fungus_type }
    entered_by { association :user }
  end
end