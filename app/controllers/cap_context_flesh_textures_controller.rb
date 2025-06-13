class CapContextFleshTexturesController < ApplicationController
  before_action :set_cap_context_flesh_texture, only: %i[ show edit update destroy ]

  # GET /cap_context_flesh_textures or /cap_context_flesh_textures.json
  def index
    @cap_context_flesh_textures = CapContextFleshTexture.all
  end

  # GET /cap_context_flesh_textures/1 or /cap_context_flesh_textures/1.json
  def show
  end

  # GET /cap_context_flesh_textures/new
  def new
    @cap_context_flesh_texture = CapContextFleshTexture.new
  end

  # GET /cap_context_flesh_textures/1/edit
  def edit
  end

  # POST /cap_context_flesh_textures or /cap_context_flesh_textures.json
  def create
    @cap_context_flesh_texture = CapContextFleshTexture.new(cap_context_flesh_texture_params)

    respond_to do |format|
      if @cap_context_flesh_texture.save
        format.html { redirect_to @cap_context_flesh_texture, notice: "Cap context flesh texture was successfully created." }
        format.json { render :show, status: :created, location: @cap_context_flesh_texture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cap_context_flesh_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cap_context_flesh_textures/1 or /cap_context_flesh_textures/1.json
  def update
    respond_to do |format|
      if @cap_context_flesh_texture.update(cap_context_flesh_texture_params)
        format.html { redirect_to @cap_context_flesh_texture, notice: "Cap context flesh texture was successfully updated." }
        format.json { render :show, status: :ok, location: @cap_context_flesh_texture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cap_context_flesh_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cap_context_flesh_textures/1 or /cap_context_flesh_textures/1.json
  def destroy
    @cap_context_flesh_texture.destroy!

    respond_to do |format|
      format.html { redirect_to cap_context_flesh_textures_path, status: :see_other, notice: "Cap context flesh texture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cap_context_flesh_texture
      @cap_context_flesh_texture = CapContextFleshTexture.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cap_context_flesh_texture_params
    params.require(cap_context_flesh_texture: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
