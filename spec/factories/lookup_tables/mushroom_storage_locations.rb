FactoryBot.define do
  factory :mushroom_storage_location do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
