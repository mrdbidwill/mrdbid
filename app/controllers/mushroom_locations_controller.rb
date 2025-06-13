class MushroomLocationsController < ApplicationController
  before_action :set_mushroom_location, only: %i[ show edit update destroy ]

  # GET /mushroom_locations or /mushroom_locations.json
  def index
    @mushroom_locations = MushroomLocation.all
  end

  # GET /mushroom_locations/1 or /mushroom_locations/1.json
  def show
  end

  # GET /mushroom_locations/new
  def new
    @mushroom_location = MushroomLocation.new
  end

  # GET /mushroom_locations/1/edit
  def edit
  end

  # POST /mushroom_locations or /mushroom_locations.json
  def create
    @mushroom_location = MushroomLocation.new(mushroom_location_params)

    respond_to do |format|
      if @mushroom_location.save
        format.html { redirect_to @mushroom_location, notice: "Mushroom location was successfully created." }
        format.json { render :show, status: :created, location: @mushroom_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mushroom_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mushroom_locations/1 or /mushroom_locations/1.json
  def update
    respond_to do |format|
      if @mushroom_location.update(mushroom_location_params)
        format.html { redirect_to @mushroom_location, notice: "Mushroom location was successfully updated." }
        format.json { render :show, status: :ok, location: @mushroom_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mushroom_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mushroom_locations/1 or /mushroom_locations/1.json
  def destroy
    @mushroom_location.destroy!

    respond_to do |format|
      format.html { redirect_to mushroom_locations_path, status: :see_other, notice: "Mushroom location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mushroom_location
      @mushroom_location = MushroomLocation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mushroom_location_params
    params.require(mushroom_location: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
