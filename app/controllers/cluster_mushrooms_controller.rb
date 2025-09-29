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
    @clusters = policy_scope(Cluster)
  end

  def create
    @cluster_mushroom = ClusterMushroom.new(cluster_mushroom_params)
    @mushroom = Mushroom.find_by(id: cluster_mushroom_params[:mushroom_id])
    @clusters = policy_scope(Cluster)
    if @cluster_mushroom.save
      redirect_to cluster_mushroom_path(@cluster_mushroom), notice: "Cluster mushroom was successfully created."
    else
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
    redirect_to cluster_mushrooms_path, notice: "Cluster mushroom was successfully destroyed."
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
