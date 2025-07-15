class AddForeignKeysToCameras < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :cameras, :lookup_items, column: :camera_make_id
    add_foreign_key :cameras, :lookup_items, column: :camera_model_id
  end
end
