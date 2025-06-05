json.extract! data_source, :id, :name, :description, :comments, :source_id, :entered_by_id, :created_at, :updated_at
json.url data_source_url(data_source, format: :json)
