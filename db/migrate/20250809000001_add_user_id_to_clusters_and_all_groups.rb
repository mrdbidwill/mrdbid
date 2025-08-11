class AddUserIdToClustersAndAllGroups < ActiveRecord::Migration[8.0]
  def change
    add_reference :clusters, :user, null: true, foreign_key: true
    add_reference :all_groups, :user, null: true, foreign_key: true

    # Backfill user_id with the first user (or use a defined default user for such cases)
    default_user = User.first
    raise "No users found! Please create at least one user before running this migration." if default_user.nil?

    Cluster.update_all(user_id: default_user.id)
    AllGroup.update_all(user_id: default_user.id)

    # Change references to enforce NOT NULL constraint
    change_column_null :clusters, :user_id, false
    change_column_null :all_groups, :user_id, false
  end
end
