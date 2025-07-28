class CreateMbLists < ActiveRecord::Migration[8.0] # Adjust version as per your Rails app
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
    # Adding indexes to optimize queries for large tables
    add_index :mb_lists, [:taxon_name, :rank_name], unique: true, name: 'index_mblists_on_taxon_name_and_rank_name' # Unique index
    add_index :mb_lists, :taxon_name, name: 'index_mblists_on_taxon_name' # Non-unique index
    add_index :mb_lists, :rank_name, name: 'index_mblists_on_rank_name'   # Non-unique index
    add_index :mb_lists, :name_status, name: 'index_mblists_on_name_status' # Non-unique index
  end
end
