class StemLocationsController < ApplicationController
  before_action :set_stem_location, only: %i[ show edit update destroy ]

  # GET /stem_locations or /stem_locations.json
  def index
    @stem_locations = StemLocation.all
  end

  # GET /stem_locations/1 or /stem_locations/1.json
  def show
  end

  # GET /stem_locations/new
  def new
    @stem_location = StemLocation.new
  end

  # GET /stem_locations/1/edit
  def edit
  end

  # POST /stem_locations or /stem_locations.json
  def create
    @stem_location = StemLocation.new(stem_location_params)

    respond_to do |format|
      if @stem_location.save
        format.html { redirect_to @stem_location, notice: "Stem location was successfully created." }
        format.json { render :show, status: :created, location: @stem_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stem_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stem_locations/1 or /stem_locations/1.json
  def update
    respond_to do |format|
      if @stem_location.update(stem_location_params)
        format.html { redirect_to @stem_location, notice: "Stem location was successfully updated." }
        format.json { render :show, status: :ok, location: @stem_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stem_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stem_locations/1 or /stem_locations/1.json
  def destroy
    @stem_location.destroy!

    respond_to do |format|
      format.html { redirect_to stem_locations_path, status: :see_other, notice: "Stem location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stem_location
      @stem_location = StemLocation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stem_location_params
    params.require(stem_location: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
