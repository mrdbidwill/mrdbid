# frozen_string_literal: true

json.extract! mushroom, :id, :name, :description, :comment, :user_id, :created_at, :updated_at
json.url mushroom_url(mushroom, format: :json)
