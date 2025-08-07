class AddForeignKeysToAllGroupMushrooms < ActiveRecord::Migration[8.0]
def change
  add_foreign_key :all_group_mushrooms, :all_groups unless foreign_key_exists?(:all_group_mushrooms, :all_groups)
  add_foreign_key :all_group_mushrooms, :mushrooms unless foreign_key_exists?(:all_group_mushrooms, :mushrooms)
end
end

