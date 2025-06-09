FactoryBot.define do
  factory :state do
    name { "New York" }
    description { "Some description" }
    entered_by { association :user }          # Associates the state with a user
    source { association :source }
    country { association :country }
  end
end
