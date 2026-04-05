# frozen_string_literal: true

class CreateUserRecentObservations < ActiveRecord::Migration[8.0]
  def change
    create_table :user_recent_observations, if_not_exists: true do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mushroom, null: false, foreign_key: true
      t.datetime :last_viewed_at, null: false
      t.integer :view_count, null: false, default: 1

      t.timestamps
    end

    add_index :user_recent_observations, [:user_id, :mushroom_id], unique: true, name: "index_recent_obs_on_user_and_mushroom", if_not_exists: true
    add_index :user_recent_observations, [:user_id, :last_viewed_at], name: "index_recent_obs_on_user_and_last_viewed", if_not_exists: true
  end
end
