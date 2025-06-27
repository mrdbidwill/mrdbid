class CreateAllGroupMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :all_group_mushrooms do |t|
      t.integer :all_group
      t.integer :mushroom
      t.timestamps
    end
  end
end
