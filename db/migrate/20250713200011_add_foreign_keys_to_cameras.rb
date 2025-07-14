class AddForeignKeysToCameras < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :cameras, :lookup_items, column: :camera_makes
    add_foreign_key :cameras, :lookup_items, column: :camera_models
  end
end
