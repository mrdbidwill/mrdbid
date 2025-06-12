class SoilTypesController < ApplicationController
  before_action :set_soil_type, only: %i[ show edit update destroy ]

  # GET /soil_types or /soil_types.json
  def index
    @soil_types = SoilType.all
  end

  # GET /soil_types/1 or /soil_types/1.json
  def show
  end

  # GET /soil_types/new
  def new
    @soil_type = SoilType.new
  end

  # GET /soil_types/1/edit
  def edit
  end

  # POST /soil_types or /soil_types.json
  def create
    @soil_type = SoilType.new(soil_type_params)

    respond_to do |format|
      if @soil_type.save
        format.html { redirect_to @soil_type, notice: "Soil type was successfully created." }
        format.json { render :show, status: :created, location: @soil_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @soil_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soil_types/1 or /soil_types/1.json
  def update
    respond_to do |format|
      if @soil_type.update(soil_type_params)
        format.html { redirect_to @soil_type, notice: "Soil type was successfully updated." }
        format.json { render :show, status: :ok, location: @soil_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @soil_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soil_types/1 or /soil_types/1.json
  def destroy
    @soil_type.destroy!

    respond_to do |format|
      format.html { redirect_to soil_types_path, status: :see_other, notice: "Soil type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soil_type
      @soil_type = SoilType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def soil_type_params
      params.expect(soil_type: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
