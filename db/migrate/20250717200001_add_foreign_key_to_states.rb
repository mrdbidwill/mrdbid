class AddForeignKeyToStates < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :states, :lookup_items, column: :country_id
  end
end
