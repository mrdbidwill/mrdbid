class StemSurfacesController < ApplicationController
  before_action :set_stem_surface, only: %i[ show edit update destroy ]

  # GET /stem_surfaces or /stem_surfaces.json
  def index
    @stem_surfaces = StemSurface.all
  end

  # GET /stem_surfaces/1 or /stem_surfaces/1.json
  def show
  end

  # GET /stem_surfaces/new
  def new
    @stem_surface = StemSurface.new
  end

  # GET /stem_surfaces/1/edit
  def edit
  end

  # POST /stem_surfaces or /stem_surfaces.json
  def create
    @stem_surface = StemSurface.new(stem_surface_params)

    respond_to do |format|
      if @stem_surface.save
        format.html { redirect_to @stem_surface, notice: "Stem surface was successfully created." }
        format.json { render :show, status: :created, location: @stem_surface }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stem_surface.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stem_surfaces/1 or /stem_surfaces/1.json
  def update
    respond_to do |format|
      if @stem_surface.update(stem_surface_params)
        format.html { redirect_to @stem_surface, notice: "Stem surface was successfully updated." }
        format.json { render :show, status: :ok, location: @stem_surface }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stem_surface.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stem_surfaces/1 or /stem_surfaces/1.json
  def destroy
    @stem_surface.destroy!

    respond_to do |format|
      format.html { redirect_to stem_surfaces_path, status: :see_other, notice: "Stem surface was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stem_surface
      @stem_surface = StemSurface.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stem_surface_params
      params.expect(stem_surface: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
