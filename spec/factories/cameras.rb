FactoryBot.define do
  factory :camera do
    camera_model { "Canon EOS R5" }
    camera_make { create(:camera_make) } # Creates associated `camera_make`
    entered_by { create(:user) } # Creates associated `user`
  end
end