class RemoveCameraIdFromImageMushrooms < ActiveRecord::Migration[8.0]
  def change
    remove_column :image_mushrooms, :camera_id, :bigint
  end
end
