 # app/models/lookup_item.rb
 # frozen_string_literal: true
 class LookupItem < ApplicationRecord
   belongs_to :lookup_type
   belongs_to :source_data, optional: true

  validates :name, presence: true, uniqueness: { scope: :lookup_type_id }

   # Delegate name of lookup_type for convenience
   delegate :name, to: :lookup_type, prefix: true, allow_nil: true

   scope :by_type, ->(type_name) { joins(:lookup_type).where(lookup_types: { name: type_name }) }
   #  usage of scope :by_type: LookupItem.by_type("Fungus Type")



   # Implement convenience method to get a more descriptive lookup_type name
   def full_type
     "#{lookup_type_name}: #{name}"
   end
 end
