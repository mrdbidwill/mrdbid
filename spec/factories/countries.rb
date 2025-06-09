FactoryBot.define do
  factory :country do
    name { "United States" }
    description { "Some description" }
    entered_by { association :user }   # Associates the country with a user
    source { association :source } # Ensures source is linked to the same user
  end
end
