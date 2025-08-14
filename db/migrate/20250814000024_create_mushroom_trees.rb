class CreateMushroomTrees < ActiveRecord::Migration[8.0]
  def change
    create_table :mushroom_trees do |t|
      t.references :mushroom, foreign_key: true
      t.references :tree, foreign_key: true 
      t.timestamps
    end
  end
end
