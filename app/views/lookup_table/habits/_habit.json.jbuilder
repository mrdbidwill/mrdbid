json.extract! habit, :id, :name, :description, :comments, :source, :created_at, :updated_at
json.url habit_url(habit, format: :json)
