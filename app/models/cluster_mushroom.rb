class ClusterMushroom < ApplicationRecord
  belongs_to :mushroom
  belongs_to :cluster

  validate :ensure_same_user

  private

  def ensure_same_user
    if mushroom.user_id != cluster.user_id
      errors.add(:cluster, "must belong to the same user as the mushroom")
    end
  end
end

