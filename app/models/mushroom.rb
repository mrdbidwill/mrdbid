class Mushroom < ApplicationRecord
  belongs_to :state
  belongs_to :country, class_name: "LookupTables::Country", foreign_key: "country_id"
  belongs_to :fungus_type, class_name: "LookupTables::FungusType", foreign_key: "fungus_type_id"
  belongs_to :mushroom_storage_location, class_name: "LookupTables::MushroomStorageLocation", foreign_key: "mushroom_storage_location_id"
end
