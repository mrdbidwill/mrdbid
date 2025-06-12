json.extract! toxic, :id, :name, :description, :comments, :source_id, :entered_by_id, :created_at, :updated_at
json.url toxic_url(toxic, format: :json)
