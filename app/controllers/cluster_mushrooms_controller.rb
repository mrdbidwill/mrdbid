# This controller manages the pivot table cluster_mushrooms between clusters and mushrooms
# which allows a user to add a mushroom object to a cluster

class ClusterMushroomsController < ApplicationController
  include Pundit::Authorization

  before_action :set_cluster_mushroom, only: %i[ show edit update destroy ]

  # Skip Pundit verification - authorization handled via ownership checks
  skip_after_action :verify_authorized, raise: false

  def index
    @cluster_mushrooms = ClusterMushroom.all
  end

  def show
  end

  def new
    @mushroom = Mushroom.find(params[:mushroom_id]) if params[:mushroom_id]
    @cluster_mushroom = ClusterMushroom.new(mushroom: @mushroom)
    # Only clusters owned by the mushroom owner should be selectable
    @clusters = if @mushroom
                  Cluster.where(user_id: @mushroom.user_id)
                else
                  Cluster.none
                end
  end

  def create
    @cluster_mushroom = ClusterMushroom.new(cluster_mushroom_params)
    @mushroom = Mushroom.find_by(id: cluster_mushroom_params[:mushroom_id])
    # Disable strict_loading for error rendering
    @cluster_mushroom.strict_loading!(false)
    # Assign mushroom association to avoid strict_loading violations in view
    @cluster_mushroom.mushroom = @mushroom if @mushroom
    # Only clusters owned by the mushroom owner should be selectable
    @clusters = @mushroom ? Cluster.where(user_id: @mushroom.user_id) : Cluster.none
    # Ownership guard: cluster must belong to the mushroom owner
    if @mushroom && Cluster.where(id: @cluster_mushroom.cluster_id, user_id: @mushroom.user_id).exists? && @cluster_mushroom.save
      redirect_to cluster_mushroom_path(@cluster_mushroom), notice: "Cluster mushroom was successfully created."
    else
      @cluster_mushroom.errors.add(:cluster_id, "is not owned by the mushroom owner") if @mushroom && @cluster_mushroom.cluster_id.present? && !Cluster.where(id: @cluster_mushroom.cluster_id, user_id: @mushroom.user_id).exists?
      render :new, status: :unprocessable_entity
    end
  end



  def edit
    # Verify user owns the mushroom
    unless @cluster_mushroom.mushroom && @cluster_mushroom.mushroom.user_id == current_user.id
      redirect_to mushrooms_path, alert: "You can only edit your own mushroom associations."
      return
    end
  end

  def update
    # Verify user owns the mushroom
    unless @cluster_mushroom.mushroom && @cluster_mushroom.mushroom.user_id == current_user.id
      redirect_to mushrooms_path, alert: "You can only update your own mushroom associations."
      return
    end

    if @cluster_mushroom.update(cluster_mushroom_params)
      redirect_to cluster_mushroom_path(@cluster_mushroom), notice: "Cluster mushroom was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    # Verify user owns the mushroom
    unless @cluster_mushroom.mushroom && @cluster_mushroom.mushroom.user_id == current_user.id
      redirect_to mushrooms_path, alert: "You can only delete your own mushroom associations."
      return
    end

    @cluster_mushroom.destroy
    redirect_to mushrooms_path, notice: "Cluster was successfully removed."
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cluster_mushroom
    @cluster_mushroom = ClusterMushroom
                            .includes(:mushroom, :cluster)
                            .find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def cluster_mushroom_params
    params.require(:cluster_mushroom).permit(
      :mushroom_id,
      :cluster_id
    )
  end
end
