# frozen_string_literal: true

class User < ApplicationRecord
  # Add default Devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :validatable,
         :two_factor_authenticatable

  # Add the OTP encryption key
  devise :two_factor_authenticatable,
         otp_secret_encryption_key: Rails.application.credentials.otp_key


  # Association with mushrooms
  has_many :mushrooms, dependent: :destroy
  has_many :user_roles
  has_many :roles, through: :user_roles

end
