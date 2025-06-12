class UniversalOuterVeilTexturesController < ApplicationController
  before_action :set_universal_outer_veil_texture, only: %i[ show edit update destroy ]

  # GET /universal_outer_veil_textures or /universal_outer_veil_textures.json
  def index
    @universal_outer_veil_textures = UniversalOuterVeilTexture.all
  end

  # GET /universal_outer_veil_textures/1 or /universal_outer_veil_textures/1.json
  def show
  end

  # GET /universal_outer_veil_textures/new
  def new
    @universal_outer_veil_texture = UniversalOuterVeilTexture.new
  end

  # GET /universal_outer_veil_textures/1/edit
  def edit
  end

  # POST /universal_outer_veil_textures or /universal_outer_veil_textures.json
  def create
    @universal_outer_veil_texture = UniversalOuterVeilTexture.new(universal_outer_veil_texture_params)

    respond_to do |format|
      if @universal_outer_veil_texture.save
        format.html { redirect_to @universal_outer_veil_texture, notice: "Universal outer veil texture was successfully created." }
        format.json { render :show, status: :created, location: @universal_outer_veil_texture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @universal_outer_veil_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universal_outer_veil_textures/1 or /universal_outer_veil_textures/1.json
  def update
    respond_to do |format|
      if @universal_outer_veil_texture.update(universal_outer_veil_texture_params)
        format.html { redirect_to @universal_outer_veil_texture, notice: "Universal outer veil texture was successfully updated." }
        format.json { render :show, status: :ok, location: @universal_outer_veil_texture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @universal_outer_veil_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universal_outer_veil_textures/1 or /universal_outer_veil_textures/1.json
  def destroy
    @universal_outer_veil_texture.destroy!

    respond_to do |format|
      format.html { redirect_to universal_outer_veil_textures_path, status: :see_other, notice: "Universal outer veil texture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_universal_outer_veil_texture
      @universal_outer_veil_texture = UniversalOuterVeilTexture.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def universal_outer_veil_texture_params
      params.expect(universal_outer_veil_texture: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
