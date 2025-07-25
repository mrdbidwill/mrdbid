 # app/models/lookup_item.rb
 # frozen_string_literal: true

 class LookupItem < ApplicationRecord

   self.inheritance_column = :_type_disabled  # stop rails from using default type column STI

   belongs_to :source_data, optional: true
   belongs_to :lookup_type
   belongs_to :mr_character, optional: true # Add this for clarity

   # Ensure the name and parent combination is unique
   validates :name, presence: true, uniqueness: { scope: :lookup_type_id }

   # Delegate name of lookup_type for convenience
   delegate :name, to: :lookup_type, prefix: true, allow_nil: true

   scope :by_type, ->(type_name) { joins(:lookup_type).where(lookup_types: { name: type_name }) }
   #  usage of scope :by_type: LookupItem.by_type("Fungus Type")

   # Scope for countries
   scope :countries, -> { joins(:mr_character).where(mr_characters: { name: 'countries' }) }


   # Implement a convenience method to get a more descriptive lookup_type name
   def full_type
     "#{lookup_type_name}: #{name}"
   end

   def self.available_for_mushroom_creation
     by_type('SomeType').pluck(:name, :id) # Adjust the type name as needed
   end


 end
