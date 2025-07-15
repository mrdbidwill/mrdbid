class AddForeignKeysToAllGroupMushrooms < ActiveRecord::Migration[8.0]
def change
  add_foreign_key :all_group_mushrooms, :mushrooms
  add_foreign_key :all_group_mushrooms, :lookup_items, column: :all_group_id
end
end

