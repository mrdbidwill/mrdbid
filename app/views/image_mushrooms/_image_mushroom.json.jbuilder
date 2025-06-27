json.extract! image_mushroom, :id, :mushroom_id_id, :parts_id, :image_name, :image_file_address, :image_width, :image_height, :camera_make_id, :camera_model, :lens, :exposure, :aperture, :iso, :created_at, :updated_at
json.url image_mushroom_url(image_mushroom, format: :json)
