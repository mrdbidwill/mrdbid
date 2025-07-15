class CreateAllGroupMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :all_group_mushrooms do |t|
      t.references :all_group, null: false, foreign_key: false # Foreign key added in a separate migration
      t.references :mushroom, null: false, foreign_key: false # Foreign key added in a separate migration

      t.timestamps
    end
  end
end
