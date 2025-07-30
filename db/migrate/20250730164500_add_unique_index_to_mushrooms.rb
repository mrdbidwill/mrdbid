class AddUniqueIndexToMushrooms < ActiveRecord::Migration[8.0]
  def change
    add_index :mushrooms, [:user_id, :name], unique: true
  end
end
