class CapSurfaceTexturesController < ApplicationController
  before_action :set_cap_surface_texture, only: %i[ show edit update destroy ]

  # GET /cap_surface_textures or /cap_surface_textures.json
  def index
    @cap_surface_textures = CapSurfaceTexture.all
  end

  # GET /cap_surface_textures/1 or /cap_surface_textures/1.json
  def show
  end

  # GET /cap_surface_textures/new
  def new
    @cap_surface_texture = CapSurfaceTexture.new
  end

  # GET /cap_surface_textures/1/edit
  def edit
  end

  # POST /cap_surface_textures or /cap_surface_textures.json
  def create
    @cap_surface_texture = CapSurfaceTexture.new(cap_surface_texture_params)

    respond_to do |format|
      if @cap_surface_texture.save
        format.html { redirect_to @cap_surface_texture, notice: "Cap surface texture was successfully created." }
        format.json { render :show, status: :created, location: @cap_surface_texture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cap_surface_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cap_surface_textures/1 or /cap_surface_textures/1.json
  def update
    respond_to do |format|
      if @cap_surface_texture.update(cap_surface_texture_params)
        format.html { redirect_to @cap_surface_texture, notice: "Cap surface texture was successfully updated." }
        format.json { render :show, status: :ok, location: @cap_surface_texture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cap_surface_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cap_surface_textures/1 or /cap_surface_textures/1.json
  def destroy
    @cap_surface_texture.destroy!

    respond_to do |format|
      format.html { redirect_to cap_surface_textures_path, status: :see_other, notice: "Cap surface texture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cap_surface_texture
      @cap_surface_texture = CapSurfaceTexture.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cap_surface_texture_params
      params.expect(cap_surface_texture: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
