json.extract! camera, :id, :name, :description, :comments, :camera_make_id, :camera_model_id, :created_at, :updated_at
json.url camera_url(camera, format: :json)
