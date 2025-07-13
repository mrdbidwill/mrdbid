class AddForeignKeysToCameras < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :cameras, :camera_makes
    add_foreign_key :cameras, :camera_models
  end
end
