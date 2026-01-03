class ClustersController < ApplicationController
  include Pundit::Authorization

  # GET /clusters or /clusters.json
  def index
    @clusters = policy_scope(Cluster)
    respond_to do |format|

      format.html 
      format.json { render json: @clusters }
    end
  end

  # GET /clusters/1 or /clusters/1.json
  def show
    @cluster = authorize current_user.clusters.find(params[:id])
    respond_to do |format|

      format.html 
      format.json { render json: @clusters }
    end
  end


  # GET /clusters/new
  def new
    @cluster = Cluster.new
    # Allow access to new action for signed-in users without ownership requirement
    authorize @cluster, :new?
    respond_to do |format|

      format.html 
      format.json { render json: @clusters }
    end
  end

  # GET /clusters/1/edit
  def edit
    @cluster = authorize current_user.clusters.find(params[:id])
    respond_to do |format|

      format.html 
      format.json { render json: @clusters }
    end
  end


  # POST /clusters or /clusters.json
  def create
    @cluster = current_user.clusters.build(cluster_params)
    authorize @cluster
    if @cluster.save
      flash[:notice] = "Cluster was successfully created."
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.action(:redirect, cluster_url(@cluster))
        end
        format.html { redirect_to cluster_url(@cluster), notice: "Cluster was successfully created.", status: :see_other }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clusters/1 or /clusters/1.json
  def update
    @cluster = authorize current_user.clusters.find(params[:id])
    if @cluster.update(cluster_params)
      flash[:notice] = "Cluster was successfully updated."
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.action(:redirect, @cluster)
        end
        format.html { redirect_to @cluster, notice: "Cluster was successfully updated.", status: :see_other }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /clusters/1 or /clusters/1.json
  def destroy
    @cluster = authorize current_user.clusters.find(params[:id])
    @cluster.destroy!
    flash[:notice] = "Cluster was successfully deleted."
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.action(:redirect, clusters_path)
      end
      format.html { redirect_to clusters_path, notice: "Cluster was successfully deleted.", status: :see_other }
    end
  end


  private
  # Only allow a list of trusted parameters through.
    def cluster_params
      params.expect(cluster: [ :name, :description, :comments ])
    end
end
