class CreateClusterMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :cluster_mushrooms do |t|
      t.references :cluster, null: false, foreign_key: false # Foreign key added in a separate migration
      t.references :mushroom, null: false, foreign_key: false # Foreign key added in a separate migration
      t.timestamps
    end
  end
end
