class MushroomStorageLocationsController < ApplicationController
  include Pundit::Authorization

  # GET /mushroom_storage_locations or /mushroom_storage_locations.json
  def index
    @mushroom_storage_locations = policy_scope(MushroomStorageLocation)
    respond_to do |format|

      format.html
      format.json { render json: @mushroom_storage_locations }
    end
  end

  # GET /mushroom_storage_locations/1 or /mushroom_storage_locations/1.json
  def show
    @mushroom_storage_location = authorize current_user.mushroom_storage_locations.find(params[:id])
    respond_to do |format|

      format.html
      format.json { render json: @mushroom_storage_locations }
    end
  end


  # GET /mushroom_storage_locations/new
  def new
    @mushroom_storage_location = MushroomStorageLocation.new
    # Allow access to new action for signed-in users without ownership requirement
    authorize @mushroom_storage_location, :new?
    respond_to do |format|

      format.html
      format.json { render json: @mushroom_storage_locations }
    end
  end

  # GET /mushroom_storage_locations/1/edit
  def edit
    @mushroom_storage_location = authorize current_user.mushroom_storage_locations.find(params[:id])
    respond_to do |format|

      format.html
      format.json { render json: @mushroom_storage_locations }
    end
  end


  # POST /mushroom_storage_locations or /mushroom_storage_locations.json
  def create
    @mushroom_storage_location = current_user.mushroom_storage_locations.build(mushroom_storage_location_params)
    authorize @mushroom_storage_location
    if @mushroom_storage_location.save
      redirect_to mushroom_storage_location_url(@mushroom_storage_location), notice: "MushroomStorageLocation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mushroom_storage_locations/1 or /mushroom_storage_locations/1.json
  def update
    @mushroom_storage_location = authorize current_user.mushroom_storage_locations.find(params[:id])
    if @mushroom_storage_location.update(mushroom_storage_location_params)
      redirect_to @mushroom_storage_location, notice: "MushroomStorageLocation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /mushroom_storage_locations/1 or /mushroom_storage_locations/1.json
  def destroy
    @mushroom_storage_location = authorize current_user.mushroom_storage_locations.find(params[:id])
    @mushroom_storage_location.destroy!
    redirect_to mushroom_storage_locations_path, notice: "MushroomStorageLocation was successfully destroyed."
  end


  private
  # Only allow a list of trusted parameters through.
  def mushroom_storage_location_params
    params.expect(mushroom_storage_location: [ :name, :description, :comments ])
  end
end
