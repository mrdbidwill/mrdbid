class AddForeignKeyToSourceData < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :source_data, :source_data_types, column: :source_data_type_id
  end
end
