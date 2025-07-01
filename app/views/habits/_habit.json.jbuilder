json.extract! habit, :id, :name, :description, :comments, :source_id, :entered_by_id, :created_at, :updated_at
json.url habit_url(habit, format: :json)
