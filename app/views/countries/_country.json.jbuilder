json.extract! country, :id, :name, :description, :comments, :source, :created_at, :updated_at
json.url country_url(country, format: :json)
