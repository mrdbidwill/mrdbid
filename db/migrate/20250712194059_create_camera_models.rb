class CreateCameraModels < ActiveRecord::Migration[8.0]
  def change
    create_table :camera_models do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.references :camera_make, null: false, foreign_key: true

      t.timestamps
    end
  end
end
