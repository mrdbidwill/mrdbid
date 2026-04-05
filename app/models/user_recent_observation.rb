# frozen_string_literal: true

class UserRecentObservation < ApplicationRecord
  belongs_to :user
  belongs_to :mushroom

  validates :last_viewed_at, presence: true
  validates :view_count, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :mushroom_id, uniqueness: { scope: :user_id }

  scope :recent_first, -> { order(last_viewed_at: :desc) }
end
