class AddForeignKeysToClusterMushrooms < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :cluster_mushrooms, :mushrooms
    add_foreign_key :cluster_mushrooms, :lookup_items, column: :clusters
  end
end
