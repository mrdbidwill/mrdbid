class AddForeignKeyToMushrooms < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :mushrooms, :users
  end
end
