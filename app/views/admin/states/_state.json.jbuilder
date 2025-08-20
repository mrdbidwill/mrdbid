json.extract! state, :id, :name, :description, :comments, :source_data, :country_id, :created_at, :updated_at
json.url state_url(state, format: :json)
