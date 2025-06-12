class CreateImageMushroomThumbnails < ActiveRecord::Migration[8.0]
  def change
    create_table :image_mushroom_thumbnails do |t|
      t.references :image_mushroom, null: false, foreign_key: true
      t.string :thumbnail_file_address
      t.integer :image_width
      t.integer :image_height
      t.references :entered_by, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
