FactoryBot.define do
  factory :fungus_type do
    name { "Edible" }
    source { association :source }
    entered_by { association :user }
  end
end
