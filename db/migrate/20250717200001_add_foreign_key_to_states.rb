class AddForeignKeyToStates < ActiveRecord::Migration[8.0]
  def change
    # Link country_id in states to id in lookup_items
    add_foreign_key :states, :lookup_items, column: :country_id
  end
end


