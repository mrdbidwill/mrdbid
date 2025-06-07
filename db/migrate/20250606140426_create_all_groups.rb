class CreateAllGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :all_groups do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.references :source, null: false, foreign_key: true
      t.references :entered_by, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
