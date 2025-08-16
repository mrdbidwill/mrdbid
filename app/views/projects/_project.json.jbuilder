json.extract! project, :id, :name, :description, :comments, :created_at, :updated_at
json.url project_url(project, format: :json)
