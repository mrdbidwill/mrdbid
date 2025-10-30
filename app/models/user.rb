# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :permission, optional: true

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

  def otp_backup_codes
    value = super
    value.is_a?(Array) ? value : []
  end

  def otp_backup_codes=(codes)
    super(Array(codes))
  end

  # Override to generate shorter, user-friendly backup codes
  def generate_otp_backup_codes!
    codes = []
    10.times do
      # Generate 8-character codes: 4 chars + dash + 4 chars (e.g., "a3k9-m2p7")
      code = "#{SecureRandom.alphanumeric(4).downcase}-#{SecureRandom.alphanumeric(4).downcase}"
      codes << code
    end

    # Hash and store the codes
    self.otp_backup_codes = codes.map { |code| Devise::Encryptor.digest(self.class, code) }

    # Return plain text codes for display to user
    codes
  end

  def admin?
    permission_id.present? && permission_id < 5
  end

  # Association with mushrooms
  has_many :mushrooms, dependent: :destroy
  has_many :all_groups, dependent: :destroy
  has_many :clusters, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

end
