class CreateCameras < ActiveRecord::Migration[8.0]
  def change
    create_table :cameras do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.integer :camera_makes
      t.integer :camera_models
      t.integer :lens
      t.timestamps
    end
  end
end
