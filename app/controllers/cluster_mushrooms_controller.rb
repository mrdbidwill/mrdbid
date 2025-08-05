# This controller manages the pivot table cluster_mushrooms between clusters and mushrooms
# which allows a user to add a mushroom object to a cluster

class ClusterMushroomsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @mushroom = Mushroom.find(params[:mushroom_id]) # Fetch the mushroom from the URL params
    @cluster_mushroom = ClusterMushroom.new
    @clusters = Cluster.all # Optionally scope by user if needed
  end

  def create
    @cluster_mushroom = ClusterMushroom.new(cluster_mushroom_params)
    @cluster_mushroom.mushroom_id = params[:mushroom_id] # Associate with the mushroom

    if @cluster_mushroom.save
      redirect_to mushrooms_path, notice: "Mushroom was successfully added to the cluster."
    else
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

  def cluster_mushroom_params
    params.require(:cluster_mushroom).permit(:cluster_id)
  end

end
