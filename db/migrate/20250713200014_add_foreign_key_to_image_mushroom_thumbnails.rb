class AddForeignKeysToImageMushroomThumbnails < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :image_mushroom_thumbnails, :image_mushrooms
  end
end
