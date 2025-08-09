class AddUserIdToClustersAndAllGroups < ActiveRecord::Migration[8.0]
  def change
    add_reference :clusters, :user, null: false, foreign_key: true
    add_reference :all_groups, :user, null: false, foreign_key: true
  end
end


