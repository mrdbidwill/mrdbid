class AddForeignKeysToAllGroupMushrooms < ActiveRecord::Migration[8.0]
def change
  add_foreign_key :all_group_mushrooms, :mushrooms
  add_foreign_key :all_group_mushrooms, :all_groups
end
end

