# app/models/mushroom.rb
# frozen_string_literal: true

class Mushroom < ApplicationRecord
  belongs_to :user

  has_many :mr_character_mushrooms, dependent: :destroy
  has_many :mr_characters, through: :mr_character_mushrooms

  # Use I18n for validation messages stored in config/locales/en.yml
  validates :name, presence: { message: I18n.t("errors.messages.name_blank") },
            length: { maximum: 255 },
            uniqueness: { scope: :user_id, message: I18n.t("errors.messages.name_unique") }

  validates :user, presence: true
  validates :description, length: {
    maximum: 4096,
    message: I18n.t("errors.messages.too_long", attribute: I18n.t("activerecord.attributes.mushroom.description"), count: 4096)
  }

  validates :comment, length: { maximum: 4096, message: I18n.t("errors.messages.comment_limit") }

scope :recent, -> { order(created_at: :desc) }
scope :by_name, -> { order(:name) }
scope :search_by_name, ->(query) { where("name ILIKE ?", "%#{query}%") }
scope :by_user, ->(user_id) { where(user_id: user_id) }
end
