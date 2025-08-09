class ClustersController < ApplicationController
  include Pundit::Authorization

  before_action :set_and_authorize_cluster, only: %i[ show edit update destroy ]
  before_action :authorize_new_cluster, only: %i[new create]

  # GET /clusters or /clusters.json
  def index
    @clusters = policy_scope(Cluster)
  end

  # GET /clusters/1 or /clusters/1.json
  def show
  end

  # GET /clusters/new
  def new
    @cluster = Cluster.new
  end

  # GET /clusters/1/edit
  def edit
  end

  # POST /clusters or /clusters.json
  def create
    @mushroom = current_user.mushrooms.find(params[:mushroom_id])
    @cluster = current_user.clusters.find(params[:cluster_mushroom][:cluster_id])

    # Authorize at the record/resource level
    authorize @cluster

    @cluster_mushroom = ClusterMushroom.new(mushroom: @mushroom, cluster: @cluster)

    if @cluster_mushroom.save
      redirect_to mushrooms_path, notice: "Mushroom successfully added to the cluster."
    else
      render :new, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /clusters/1 or /clusters/1.json
  def update
    respond_to do |format|
      if @cluster.update(cluster_params)
        format.html { redirect_to @cluster, notice: "Cluster was successfully updated." }
        format.json { render :show, status: :ok, location: @cluster }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cluster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clusters/1 or /clusters/1.json
  def destroy
    @cluster.destroy!

    respond_to do |format|
      format.html { redirect_to clusters_path, status: :see_other, notice: "Cluster was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_cluster
      @cluster = authorize current_user.clusters.find(params[:id])
    end

  def authorize_new_cluster
    authorize Cluster
  end


  # Only allow a list of trusted parameters through.
    def cluster_params
      params.expect(cluster: [ :name, :description, :comments ])
    end
end
