FactoryBot.define do
  factory :source do
    title { "Sample Title" }
    author { "Sample Author" }
    ref { "REF123" }
    item_code { "ITEM123" }
    comment { "Sample comment text." }
    my_rating { 5 }
    my_comment { "This is my personal comment." }
    entered_by { create(:user) } # Associates the source with a user
  end
end