class AddForeignKeysToImageMushrooms < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :image_mushrooms, :mushrooms # Adds foreign key for mushrooms
    add_foreign_key :image_mushrooms, :lookup_items, column: :part_id
    add_foreign_key :image_mushrooms, :lookup_items, column: :camera_make_id
    add_foreign_key :image_mushrooms, :lookup_items, column: :camera_model_id
  end
end

