class CreatePartialInnerVeilFates < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:partial_inner_veil_fates)

    create_table :partial_inner_veil_fates do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
