# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a user for seeding (idempotent)
user = User.find_or_create_by!(email: "seeder@example.com") do |user|
  user.name = "Seeder User"
  user.password = "securepassword"
  user.password_confirmation = "securepassword"
end

# Create sources with the user (idempotent)
source = Source.find_or_create_by!(title: "Default Source", entered_by: user)

# Create countries (idempotent)
usa = Country.find_or_create_by!(name: "United States") do |country|
  country.description = "USA Description"
  country.entered_by = user
  country.source = source
end

mexico = Country.find_or_create_by!(name: "Mexico") do |country|
  country.description = "Mexico Description"
  country.entered_by = user
  country.source = source
end

# Create states associated with countries (idempotent)
State.find_or_create_by!(name: "New York") do |state|
  state.description = "State description"
  state.entered_by = user
  state.source = source
  state.country = usa
end

State.find_or_create_by!(name: "California") do |state|
  state.description = "State description"
  state.entered_by = user
  state.source = source
  state.country = usa
end

State.find_or_create_by!(name: "Yucatan") do |state|
  state.description = "State description"
  state.entered_by = user
  state.source = source
  state.country = mexico
end
