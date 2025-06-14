class Cluster < ApplicationRecord
  has_many :cluster_mushrooms, dependent: :restrict_with_error
  has_many :mushrooms, through: :cluster_mushrooms

  belongs_to :entered_by, class_name: "User"
  belongs_to :source

  before_destroy :ensure_no_mushrooms

  private

  def ensure_no_mushrooms
    if mushrooms.exists?
      errors.add(:base, "Cannot delete a cluster with associated mushrooms")
      throw(:abort)
    end
  end
end
