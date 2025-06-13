FactoryBot.define do
  factory :camera_make do
    name { "Canon" }
    source { create(:source) } # Creates an associated source record
    entered_by { create(:user) } # Creates associated `user`
  end
end