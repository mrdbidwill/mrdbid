class CreateMbLists < ActiveRecord::Migration[8.0]
  def change
    create_table :mb_lists do |t|
      t.string :taxon_name
      t.string :authors
      t.string :rank_name
      t.integer :year_of_effective_publication
      t.string :name_status
      t.bigint :mycobank_number
      t.string :hyperlink
      t.text :classification
      t.string :current_name
      t.text :synonymy
      t.timestamps
    end
  end
end
