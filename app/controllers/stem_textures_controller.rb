class StemTexturesController < ApplicationController
  before_action :set_stem_texture, only: %i[ show edit update destroy ]

  # GET /stem_textures or /stem_textures.json
  def index
    @stem_textures = StemTexture.all
  end

  # GET /stem_textures/1 or /stem_textures/1.json
  def show
  end

  # GET /stem_textures/new
  def new
    @stem_texture = StemTexture.new
  end

  # GET /stem_textures/1/edit
  def edit
  end

  # POST /stem_textures or /stem_textures.json
  def create
    @stem_texture = StemTexture.new(stem_texture_params)

    respond_to do |format|
      if @stem_texture.save
        format.html { redirect_to @stem_texture, notice: "Stem texture was successfully created." }
        format.json { render :show, status: :created, location: @stem_texture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stem_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stem_textures/1 or /stem_textures/1.json
  def update
    respond_to do |format|
      if @stem_texture.update(stem_texture_params)
        format.html { redirect_to @stem_texture, notice: "Stem texture was successfully updated." }
        format.json { render :show, status: :ok, location: @stem_texture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stem_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stem_textures/1 or /stem_textures/1.json
  def destroy
    @stem_texture.destroy!

    respond_to do |format|
      format.html { redirect_to stem_textures_path, status: :see_other, notice: "Stem texture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stem_texture
      @stem_texture = StemTexture.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stem_texture_params
    params.require(stem_texture: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
