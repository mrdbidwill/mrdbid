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
end