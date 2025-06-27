class ClusterMushroomsController < ApplicationController
  before_action :set_cluster_mushroom, only: %i[ show edit update destroy ]

  # GET /cluster_mushrooms or /cluster_mushrooms.json
  def index
    @cluster_mushrooms = ClusterMushroom.all
  end

  # GET /cluster_mushrooms/1 or /cluster_mushrooms/1.json
  def show
  end

  # GET /cluster_mushrooms/new
  def new
    @cluster_mushroom = ClusterMushroom.new
  end

  # GET /cluster_mushrooms/1/edit
  def edit
  end

  # POST /cluster_mushrooms or /cluster_mushrooms.json
  def create
    @cluster_mushroom = ClusterMushroom.new(cluster_mushroom_params)

    respond_to do |format|
      if @cluster_mushroom.save
        format.html { redirect_to @cluster_mushroom, notice: "Cluster mushroom was successfully created." }
        format.json { render :show, status: :created, location: @cluster_mushroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cluster_mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cluster_mushrooms/1 or /cluster_mushrooms/1.json
  def update
    respond_to do |format|
      if @cluster_mushroom.update(cluster_mushroom_params)
        format.html { redirect_to @cluster_mushroom, notice: "Cluster mushroom was successfully updated." }
        format.json { render :show, status: :ok, location: @cluster_mushroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cluster_mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cluster_mushrooms/1 or /cluster_mushrooms/1.json
  def destroy
    @cluster_mushroom.destroy!

    respond_to do |format|
      format.html { redirect_to cluster_mushrooms_path, status: :see_other, notice: "Cluster mushroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cluster_mushroom
      @cluster_mushroom = ClusterMushroom.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cluster_mushroom_params
      params.expect(cluster_mushroom: [ :cluster_id, :mushroom_id ])
    end
end
