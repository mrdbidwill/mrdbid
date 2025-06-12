FactoryBot.define do
  factory :source do
    title { "Test Source" }
    entered_by { association :user } # Associates the source with a user
  end
end
