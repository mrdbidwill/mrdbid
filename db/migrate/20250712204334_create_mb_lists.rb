class CreateMbLists < ActiveRecord::Migration[8.0] # Adjust version as per your Rails app
  def change
    return if table_exists?(:mb_lists)
    create_table :mb_lists do |t|
      t.text :taxon_name
      t.text :authors
      t.text :rank_name
      t.text :year_of_effective_publication   # data contains question marks
      t.text :name_status
      t.text :mycobank_number
      t.text :hyperlink
      t.text :classification
      t.text :current_name
      t.text :synonymy
    end
    # Add indexes with key lengths
    add_index :mb_lists, [:taxon_name, :rank_name],
              unique: true,
              name: 'index_mblists_on_taxon_name_and_rank_name',
              length: { taxon_name: 100, rank_name: 100 }

    add_index :mb_lists, :taxon_name,
              name: 'index_mblists_on_taxon_name',
              length: 100

    add_index :mb_lists, :rank_name,
              name: 'index_mblists_on_rank_name',
              length: 100

    add_index :mb_lists, :name_status,
              name: 'index_mblists_on_name_status',
              length: 50

  end
end
