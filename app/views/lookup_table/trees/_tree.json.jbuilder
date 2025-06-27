json.extract! tree, :id, :name, :description, :comments, :source, :created_at, :updated_at
json.url tree_url(tree, format: :json)
