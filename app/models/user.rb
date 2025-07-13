# frozen_string_literal: true

class User < ApplicationRecord
  # Add default Devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :confirmable, :lockable, :two_factor_authenticatable


  # Add the OTP encryption key
  devise :two_factor_authenticatable,
         otp_secret_encryption_key: ENV['OTP_SECRET_ENCRYPTION_KEY']

  # Optional: For backup codes
  devise :two_factor_backupable, otp_number_of_backup_codes: 10

  # Add methods to generate OTP secret and provisioning URI
  before_create :generate_otp_secret
  def generate_otp_secret
    self.otp_secret ||= User.generate_otp_secret
  end

  def otp_provisioning_uri(account = email, issuer: 'MRDBID')
    otp_secret.present? ? "otpauth://totp/#{issuer}:#{account}?secret=#{otp_secret}&issuer=#{issuer}" : nil
  end





  # Association with mushrooms
  has_many :mushrooms, dependent: :destroy
  has_many :user_roles
  has_many :roles, through: :user_roles

end
