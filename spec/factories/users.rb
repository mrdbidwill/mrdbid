FactoryBot.define do
  factory :user do
    sequence(:email)  { |n| "user_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    display_name { Faker::Name.name } # Generate a full name for display_name
    otp_secret { SecureRandom.hex(10) } # Securely generate a random string
  end
end

