class CreateMrCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :mr_characters do |t|
      t.string :name
      t.integer :display_option
      t.integer :part
      t.integer :source
      t.timestamps
    end
  end
end
