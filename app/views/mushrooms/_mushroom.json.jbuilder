json.extract! mushroom, :id, :mushroom_name, :common_name, :description, :comment, :mushroom_location_id, :location_found_city, :location_found_county, :state_id, :country_id, :location_public, :share_data, :date_found, :fungus_type_id, :entered_by_id, :created_at, :updated_at
json.url mushroom_url(mushroom, format: :json)
