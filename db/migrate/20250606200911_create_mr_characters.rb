class CreateMrCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :mr_characters do |t|
      t.string :name
      t.references :display_options, null: false, foreign_key: true
      t.boolean :lookup
      t.references :parts, null: false, foreign_key: true
      t.references :source, null: false, foreign_key: true
      t.references :entered_by, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
