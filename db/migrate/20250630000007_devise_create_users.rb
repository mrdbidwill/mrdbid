class DeviseCreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      ## Devise standard modules
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :display_name, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      ## Confirmable (if you enable email confirmation)
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email # Only if using reconfirmable

      ## Lockable (if you enable account locking after failed logins)
      t.integer :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## Devise Two-Factor Authentication Column (if enabling 2FA)
      t.string :otp_secret
      t.datetime :tfa_enabled_at # Optional, for tracking when 2FA was enabled
      t.integer :otp_attempts, default: 0 # Optional, to limit OTP retries
      t.datetime :last_otp_at # Optional, to track the last OTP sent

      ## Timestamps
      t.timestamps null: false
    end

    # Adding indexes for additional columns
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
    add_index :users, :unlock_token, unique: true
    add_index :users, :otp_secret, unique: true
  end
end
