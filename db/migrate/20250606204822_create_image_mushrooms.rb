class CreateImageMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :image_mushrooms do |t|
      t.references :mushroom, null: false, foreign_key: true
      t.references :parts, null: false, foreign_key: true
      t.text :description
      t.string :image_name
      t.string :file_address
      t.integer :image_width
      t.integer :image_height
      t.references :camera, null: false, foreign_key: true
      t.string :camera_model
      t.string :lens
      t.string :exposure
      t.string :aperture
      t.string :iso
      t.date :date_taken
      t.string :focal_length
      t.string :GPSLatitudeRef
      t.string :GPSLatitude_0
      t.string :GPSLatitude_1
      t.string :GPSLatitude_2
      t.string :GPSLongitudeRef
      t.string :GPSLongitude_0
      t.string :GPSLongitude_1
      t.string :GPSLongitude_2
      t.string :GPSAltitudeRef
      t.string :GPSAltitude
      t.references :entered_by, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
