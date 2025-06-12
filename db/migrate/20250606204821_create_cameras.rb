class CreateCameras < ActiveRecord::Migration[8.0]
  def change
    create_table :cameras do |t|
      t.string :camera_make, null: false
      t.string :camera_model
      t.references :entered_by, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
