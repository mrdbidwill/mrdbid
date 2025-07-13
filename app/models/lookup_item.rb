 # app/models/lookup_item.rb
 # frozen_string_literal: true
 class LookupItem < ApplicationRecord
   belongs_to :source_data, optional: true
   belongs_to :lookup_type
   belongs_to :parent, class_name: 'LookupItem', optional: true, foreign_key: :parent_id
   has_many :children, class_name: 'LookupItem', foreign_key: :parent_id, dependent: :nullify
   # Ensure the name and parent combination is unique
   validates :name, presence: true, uniqueness: { scope: [:parent_id, :lookup_type_id] }
   # Scope to get all children for a specific parent
   scope :by_parent, ->(parent_item) { where(parent: parent_item) }
   # Example: scope to get all states in a specific country
   scope :states_for_country, ->(country_name) {
     joins(:parent).where(parents_lookup_items: { name: country_name })
   }


   # Delegate name of lookup_type for convenience
   delegate :name, to: :lookup_type, prefix: true, allow_nil: true

   scope :by_type, ->(type_name) { joins(:lookup_type).where(lookup_types: { name: type_name }) }
   #  usage of scope :by_type: LookupItem.by_type("Fungus Type")



   # Implement convenience method to get a more descriptive lookup_type name
   def full_type
     "#{lookup_type_name}: #{name}"
   end

   def ancestors
     parent ? parent.ancestors + [parent] : []
   end

   def descendants
     children.includes(:children).flat_map { |child| [child] + child.descendants }
   end

 end
