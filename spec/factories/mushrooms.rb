FactoryBot.define do
  factory :mushroom do
    sequence(:name)  { |n| "Mushroom_#{n}" }
    description { "Mushroom description" }
    comment { "Mushroom comment" }
    user # This will create an associated user when building a Mushroom
  end
end

