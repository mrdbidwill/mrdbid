# Example model for the cache database
class CachedItem < CacheRecord
  # This model connects to the cache database through CacheRecord
  # 
  # Each model still represents a single table, but the connection
  # is shared with other models that inherit from CacheRecord
  #
  # Example schema:
  # create_table :cached_items do |t|
  #   t.string :key, null: false
  #   t.text :value
  #   t.datetime :expires_at
  #   t.timestamps
  # end
end