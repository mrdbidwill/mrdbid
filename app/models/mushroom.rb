# == Schema Information
#
# Table name: mushrooms
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  comments    :text
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#



# app/models/mushroom.rb
# frozen_string_literal: true

class Mushroom < ApplicationRecord
  belongs_to :user

  has_many :mr_character_mushrooms, dependent: :destroy
  has_many :mr_characters, through: :mr_character_mushrooms
  has_many :image_mushrooms, dependent: :destroy
  has_many :cluster_mushrooms, dependent: :destroy
  has_many :all_group_mushrooms, dependent: :destroy
  has_many :clusters, through: :cluster_mushrooms
  has_many :all_groups, through: :all_group_mushrooms
  has_many :images, through: :image_mushrooms
  has_many :lookup_items


  # Use I18n for validation messages stored in config/locales/en.yml
  validates :name, presence: { message: I18n.t("activerecord.errors.models.mushroom.attributes.name.blank") },
            length: { maximum: 255 },
            uniqueness: { scope: :user_id, message: I18n.t("activerecord.errors.models.mushroom.attributes.name.unique") }

  validates :user, presence: true
  validates :description, length: {
    maximum: 4096,
    message: I18n.t("errors.messages.too_long", attribute: I18n.t("activerecord.attributes.mushroom.description"), count: 4096)
  }

  validates :comments, length: { maximum: 4096, message: I18n.t("activerecord.errors.models.mushroom.attributes.comments.too_long") }

scope :recent, -> { order(created_at: :desc) }
scope :by_name, -> { order(:name) }
scope :search_by_name, ->(query) {
  database_adapter = ActiveRecord::Base.connection.adapter_name.downcase
  if database_adapter.include?("postgresql")
    # @language=MYSQL
    where("name ILIKE ?", "%#{query}%")
  elsif database_adapter.include?("mysql")
    # @language=MySQL
    where("LOWER(name) LIKE ?", "%#{query.downcase}%")
  else
    # @language=SQL
    where("LOWER(name) LIKE ?", "%#{query.downcase}%")
  end
}
scope :by_user, ->(user_id) { where(user_id: user_id) }
end
