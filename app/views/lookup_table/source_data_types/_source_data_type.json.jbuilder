json.extract! source_data_type, :id, :name, :description, :comments, :source, :created_at, :updated_at
json.url source_data_type_url(source_data_type, format: :json)
