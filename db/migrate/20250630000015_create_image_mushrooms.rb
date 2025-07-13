class CreateImageMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :image_mushrooms do |t|
      t.integer :mushroom
      t.integer :part
      t.string :image_name
      t.string :image_file_address
      t.integer :image_width
      t.integer :image_height
      t.integer :camera_make
      t.string :camera_model
      t.string :lens
      t.string :exposure
      t.string :aperture
      t.string :iso

      t.timestamps
    end
  end
end
