class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :two_factor_authenticatable # Add this line

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Other two-factor-related settings or scopes

  has_many :clusters, foreign_key: :entered_by_id, dependent: :nullify
  has_many :all_groups, foreign_key: :entered_by_id, dependent: :nullify
end
