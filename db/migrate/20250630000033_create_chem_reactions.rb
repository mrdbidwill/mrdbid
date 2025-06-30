class CreateChemReactions < ActiveRecord::Migration[8.0]
  def change
    create_table :chem_reactions do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.integer :source
      t.timestamps
    end
  end
end
