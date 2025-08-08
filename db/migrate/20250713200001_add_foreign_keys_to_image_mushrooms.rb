class AddForeignKeysToImageMushrooms < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :image_mushrooms, :mushrooms
    add_foreign_key :image_mushrooms, :parts, column: :part_id
    add_foreign_key :image_mushrooms, :camera_makes, column: :camera_make_id
    add_foreign_key :image_mushrooms, :camera_models, column: :camera_model_id
  end
end

