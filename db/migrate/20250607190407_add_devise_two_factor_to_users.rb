class AddDeviseTwoFactorToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :otp_secret, :string unless column_exists?(:users, :otp_secret)
    add_column :users, :consumed_timestep, :integer unless column_exists?(:users, :consumed_timestep)
    add_column :users, :otp_required_for_login, :boolean unless column_exists?(:users, :otp_required_for_login)
  end
end