class AddForeignKeysToImageMushrooms < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :image_mushrooms, :mushrooms
    add_foreign_key :image_mushrooms, :parts
    add_foreign_key :image_mushrooms, :lookup_items, column: :camera_make
    add_foreign_key :image_mushrooms, :lookup_items, column: :camera_model
  end
end
