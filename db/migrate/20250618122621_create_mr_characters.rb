class CreateMrCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :mr_characters do |t|
      t.string :name
      t.references :display_option, foreign_key: {to_table: :display_options}
      t.references :part, foreign_key: {to_table: :parts}
      t.references :source, foreign_key: {to_table: :sources}

      t.timestamps
    end
  end
end
