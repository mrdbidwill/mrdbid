FactoryBot.define do
  factory :mushroom_location do
    name { "With Collector" }
    source { association :source }
    entered_by { association :user }
  end
end