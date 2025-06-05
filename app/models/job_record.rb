# Example model for the queue database
class JobRecord < QueueRecord
  # This model connects to the queue database through QueueRecord
  # 
  # Each model still represents a single table, but the connection
  # is shared with other models that inherit from QueueRecord
  #
  # Example schema:
  # create_table :job_records do |t|
  #   t.string :job_class, null: false
  #   t.text :arguments
  #   t.integer :priority, default: 0
  #   t.datetime :scheduled_at
  #   t.timestamps
  # end
end