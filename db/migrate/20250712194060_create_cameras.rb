class CreateCameras < ActiveRecord::Migration[8.0]
  def change
    create_table :cameras do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.references :camera_make, foreign_key:  { to_table: :lookup_items } # Points to lookup_items instead of camera_makes
      t.references :camera_model, foreign_key:  { to_table: :lookup_items } # Points to lookup_items instead of camera_models

      t.timestamps
    end
  end
end
