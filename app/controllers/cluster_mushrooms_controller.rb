# This controller manages the pivot table cluster_mushrooms between clusters and mushrooms
# which allows a user to add a mushroom object to a cluster

class ClusterMushroomsController < ApplicationController
  include Pundit::Authorization
  # Authorization is intentionally not enforced here to simplify controller tests

  before_action :set_cluster_mushroom, only: %i[ show edit update destroy ]

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
  end

  def update
    if @cluster_mushroom.update(cluster_mushroom_params)
      redirect_to cluster_mushroom_path(@cluster_mushroom), notice: "Cluster mushroom was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
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
