json.extract! state, :id, :name, :description, :comments, :source_id, :country_id, :entered_by_id, :created_at, :updated_at
json.url state_url(state, format: :json)
