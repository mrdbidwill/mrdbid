# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create lookup items
Rails.logger.debug 'Creating lookup items...'

# Display Options
DisplayOption.find_or_create_by(name: 'Text Field') do |opt|
  opt.description = 'Simple text input'
end
DisplayOption.find_or_create_by(name: 'Select') do |opt|
  opt.description = 'Dropdown selection'
end
DisplayOption.find_or_create_by(name: 'Multi-select') do |opt|
  opt.description = 'Multiple choice selection'
end
DisplayOption.find_or_create_by(name: 'Color Picker') do |opt|
  opt.description = 'Color selection interface'
end
DisplayOption.find_or_create_by(name: 'Measurement') do |opt|
  opt.description = 'Numerical measurement with units'
end

# Parts
Part.find_or_create_by(name: 'Pileus') do |part|
  part.description = 'Cap of the mushroom'
end
Part.find_or_create_by(name: 'Stipe') do |part|
  part.description = 'Stem of the mushroom'
end
Part.find_or_create_by(name: 'Lamellae') do |part|
  part.description = 'Gills of the mushroom'
end
Part.find_or_create_by(name: 'Annulus') do |part|
  part.description = 'Ring on the stem'
end
Part.find_or_create_by(name: 'Volva') do |part|
  part.description = 'Cup at the base of the stem'
end
Part.find_or_create_by(name: 'Context') do |part|
  part.description = 'Flesh of the mushroom'
end

# Source Data
Rails.logger.debug 'Creating source data...'
SourceData.find_or_create_by(title: 'Mushrooms Demystified') do |source|
  source.author = 'David Arora'
  source.ref = 'ISBN 0-89815-169-4'
  source.source_data_type = :book
end

SourceData.find_or_create_by(title: 'MycoKey') do |source|
  source.author = 'Thomas Læssøe & Jens H. Petersen'
  source.ref = 'https://www.mycokey.com'
  source.source_data_type = :website
end

# MR Characters
Rails.logger.debug 'Creating MR characters...'
MrCharacter.find_or_create_by(name: 'Cap Color') do |character|
  character.display_option = DisplayOption.find_by(name: 'Color Picker')
  character.part = Part.find_by(name: 'Pileus')
  character.source_data = SourceData.first
end

MrCharacter.find_or_create_by(name: 'Stem Shape') do |character|
  character.display_option = DisplayOption.find_by(name: 'Select')
  character.part = Part.find_by(name: 'Stipe')
  character.source_data = SourceData.first
end

Rails.logger.debug 'Seed data created successfully!'
