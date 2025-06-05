class GillThicknessesController < ApplicationController
  before_action :set_gill_thickness, only: %i[ show edit update destroy ]

  # GET /gill_thicknesses or /gill_thicknesses.json
  def index
    @gill_thicknesses = GillThickness.all
  end

  # GET /gill_thicknesses/1 or /gill_thicknesses/1.json
  def show
  end

  # GET /gill_thicknesses/new
  def new
    @gill_thickness = GillThickness.new
  end

  # GET /gill_thicknesses/1/edit
  def edit
  end

  # POST /gill_thicknesses or /gill_thicknesses.json
  def create
    @gill_thickness = GillThickness.new(gill_thickness_params)

    respond_to do |format|
      if @gill_thickness.save
        format.html { redirect_to @gill_thickness, notice: "Gill thickness was successfully created." }
        format.json { render :show, status: :created, location: @gill_thickness }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gill_thickness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gill_thicknesses/1 or /gill_thicknesses/1.json
  def update
    respond_to do |format|
      if @gill_thickness.update(gill_thickness_params)
        format.html { redirect_to @gill_thickness, notice: "Gill thickness was successfully updated." }
        format.json { render :show, status: :ok, location: @gill_thickness }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gill_thickness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gill_thicknesses/1 or /gill_thicknesses/1.json
  def destroy
    @gill_thickness.destroy!

    respond_to do |format|
      format.html { redirect_to gill_thicknesses_path, status: :see_other, notice: "Gill thickness was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gill_thickness
      @gill_thickness = GillThickness.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gill_thickness_params
      params.expect(gill_thickness: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
