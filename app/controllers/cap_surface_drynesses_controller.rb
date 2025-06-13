class CapSurfaceDrynessesController < ApplicationController
  before_action :set_cap_surface_dryness, only: %i[ show edit update destroy ]

  # GET /cap_surface_drynesses or /cap_surface_drynesses.json
  def index
    @cap_surface_drynesses = CapSurfaceDryness.all
  end

  # GET /cap_surface_drynesses/1 or /cap_surface_drynesses/1.json
  def show
  end

  # GET /cap_surface_drynesses/new
  def new
    @cap_surface_dryness = CapSurfaceDryness.new
  end

  # GET /cap_surface_drynesses/1/edit
  def edit
  end

  # POST /cap_surface_drynesses or /cap_surface_drynesses.json
  def create
    @cap_surface_dryness = CapSurfaceDryness.new(cap_surface_dryness_params)

    respond_to do |format|
      if @cap_surface_dryness.save
        format.html { redirect_to @cap_surface_dryness, notice: "Cap surface dryness was successfully created." }
        format.json { render :show, status: :created, location: @cap_surface_dryness }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cap_surface_dryness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cap_surface_drynesses/1 or /cap_surface_drynesses/1.json
  def update
    respond_to do |format|
      if @cap_surface_dryness.update(cap_surface_dryness_params)
        format.html { redirect_to @cap_surface_dryness, notice: "Cap surface dryness was successfully updated." }
        format.json { render :show, status: :ok, location: @cap_surface_dryness }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cap_surface_dryness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cap_surface_drynesses/1 or /cap_surface_drynesses/1.json
  def destroy
    @cap_surface_dryness.destroy!

    respond_to do |format|
      format.html { redirect_to cap_surface_drynesses_path, status: :see_other, notice: "Cap surface dryness was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cap_surface_dryness
      @cap_surface_dryness = CapSurfaceDryness.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cap_surface_dryness_params
    params.require(cap_surface_dryness: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
