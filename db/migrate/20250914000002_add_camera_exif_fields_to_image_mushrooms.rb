class AddCameraExifFieldsToImageMushrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :image_mushrooms, :camera_make, :string
    add_column :image_mushrooms, :camera_model, :string
  end
end
