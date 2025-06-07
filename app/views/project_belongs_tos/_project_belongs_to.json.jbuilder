json.extract! project_belongs_to, :id, :name, :description, :comments, :source_id, :entered_by_id, :created_at, :updated_at
json.url project_belongs_to_url(project_belongs_to, format: :json)
