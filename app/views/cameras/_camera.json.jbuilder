json.extract! camera, :id, :name, :description, :comments, :camera_makes_id, :camera_models_id, :lens_id, :created_at, :updated_at
json.url camera_url(camera, format: :json)
