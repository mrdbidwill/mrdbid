class CreateClusterMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :cluster_mushrooms do |t|
      t.integer :cluster
      t.integer :mushroom
      t.timestamps
    end
  end
end
