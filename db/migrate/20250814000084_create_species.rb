class CreateSpecies < ActiveRecord::Migration[8.0]
  def change
    create_table :species do |t|
      t.string :mblist_id
      t.string :taxon_name
      t.references :genera, foreign_key: { to_table: :genera }
      t.timestamps
    end
  end
end