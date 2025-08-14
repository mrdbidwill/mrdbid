class CreateImageMushrooms < ActiveRecord::Migration[8.0]
  def change
  create_table :image_mushrooms do |t|
      t.references :mushroom, foreign_key: true
      t.references :part, foreign_key: true
      t.string :image_name
      t.integer :image_width
      t.integer :image_height
      t.references :camera, foreign_key: true
      t.string :lens
      t.string :exposure
      t.string :aperture
      t.string :iso
      t.timestamps
    end
  end
end


