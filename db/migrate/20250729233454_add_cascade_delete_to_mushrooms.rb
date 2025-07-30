class AddCascadeDeleteToMushrooms < ActiveRecord::Migration[8.0]
  def change
    # First, remove the existing foreign key
    remove_foreign_key :mushrooms, :users

    # Then, add a new foreign key with `ON DELETE CASCADE`
    add_foreign_key :mushrooms, :users, on_delete: :cascade
  end
end

