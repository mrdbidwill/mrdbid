class CreateImageMushroomThumbnails < ActiveRecord::Migration[8.0]
  def change
    create_table :image_mushroom_thumbnails do |t|
      t.integer :image_mushroom
      t.string :thumbnail_file_address
      t.integer :image_width
      t.integer :image_height

      t.timestamps
    end
  end
end
