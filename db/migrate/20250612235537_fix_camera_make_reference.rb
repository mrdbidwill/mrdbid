class FixCameraMakeReference < ActiveRecord::Migration[8.0]
  def change
    # Remove the current `camera_make` column
    remove_column :cameras, :camera_make, :string

    # Add a new `camera_make_id` column as a foreign key
    add_reference :cameras, :camera_make, null: false, foreign_key: true
  end
end