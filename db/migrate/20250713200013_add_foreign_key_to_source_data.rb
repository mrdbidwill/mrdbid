class AddForeignKeyToSourceData < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :source_data, :source_data_types
  end
end
