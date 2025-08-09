# This controller manages the pivot table cluster_mushrooms between clusters and mushrooms
# which allows a user to add a mushroom object to a cluster

class ClusterMushroomsController < ApplicationController
  include Pundit::Authorization

  before_action :set_and_authorize_cluster, only: %i[ show edit update destroy ]
  before_action :authorize_new_cluster_mushroom, only: %i[new create]
  def index
    @cluster_mushrooms = policy_scope(ClusterMushroom)
  end

  def show
  end

  def new
    authorize ClusterMushroom
    @mushroom = Mushroom.find(params[:mushroom_id]) # Fetch the mushroom from the URL params
    @cluster_mushroom = ClusterMushroom.new
    @clusters = Cluster.all # Optionally scope by user if needed
  end

  def create
    @mushroom = current_user.mushrooms.find(params[:mushroom_id]) # Ensure user owns the mushroom
    @cluster = current_user.clusters.find(params[:cluster_mushroom][:cluster_id]) # Ensure user owns the cluster
    authorize @cluster
    @cluster_mushroom = ClusterMushroom.new(mushroom: @mushroom, cluster: @cluster)

    if @cluster_mushroom.save
      redirect_to mushrooms_path, notice: "Mushroom successfully added to the cluster."
    else
      @clusters = current_user.clusters
      render :new, status: :unprocessable_entity
    end
  end



  def edit
  end

  def update
  end

  def destroy
  end


  private
  def set_and_authorize_cluster_mushroom
    @cluster_mushroom = authorize current_user.cluster_mushrooms.find(params[:id])
  end

  def authorize_new_cluster_mushroom
    authorize ClusterMushroom
  end

  def cluster_mushroom_params
    params.require(:cluster_mushroom).permit(:cluster_id)
  end

end
