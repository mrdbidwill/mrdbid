class CreateCameras < ActiveRecord::Migration[8.0]
  def change
    create_table :cameras do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.references :camera_make, null: false, foreign_key: false# Foreign key added in a separate migration
      t.references :camera_model, null: false, foreign_key: false# Foreign key added in a separate migration

      t.timestamps
    end
  end
end
