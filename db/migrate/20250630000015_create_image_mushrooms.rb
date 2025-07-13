class CreateImageMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :image_mushrooms do |t|
      t.references :mushroom, null: false, foreign_key: false # Foreign key added in a separate migration
      t.references :part, null: false, foreign_key: false# Foreign key added in a separate migration
      t.string :image_name
      t.string :image_file_address
      t.integer :image_width
      t.integer :image_height
      t.references :camera_make, foreign_key: false # Foreign key added in a separate migration
      t.references :camera_model, foreign_key: false # Foreign key added in a separate migration
      t.string :lens
      t.string :exposure
      t.string :aperture
      t.string :iso

      t.timestamps
    end
  end
end

