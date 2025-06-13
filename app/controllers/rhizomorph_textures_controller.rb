class RhizomorphTexturesController < ApplicationController
  before_action :set_rhizomorph_texture, only: %i[ show edit update destroy ]

  # GET /rhizomorph_textures or /rhizomorph_textures.json
  def index
    @rhizomorph_textures = RhizomorphTexture.all
  end

  # GET /rhizomorph_textures/1 or /rhizomorph_textures/1.json
  def show
  end

  # GET /rhizomorph_textures/new
  def new
    @rhizomorph_texture = RhizomorphTexture.new
  end

  # GET /rhizomorph_textures/1/edit
  def edit
  end

  # POST /rhizomorph_textures or /rhizomorph_textures.json
  def create
    @rhizomorph_texture = RhizomorphTexture.new(rhizomorph_texture_params)

    respond_to do |format|
      if @rhizomorph_texture.save
        format.html { redirect_to @rhizomorph_texture, notice: "Rhizomorph texture was successfully created." }
        format.json { render :show, status: :created, location: @rhizomorph_texture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rhizomorph_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rhizomorph_textures/1 or /rhizomorph_textures/1.json
  def update
    respond_to do |format|
      if @rhizomorph_texture.update(rhizomorph_texture_params)
        format.html { redirect_to @rhizomorph_texture, notice: "Rhizomorph texture was successfully updated." }
        format.json { render :show, status: :ok, location: @rhizomorph_texture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rhizomorph_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rhizomorph_textures/1 or /rhizomorph_textures/1.json
  def destroy
    @rhizomorph_texture.destroy!

    respond_to do |format|
      format.html { redirect_to rhizomorph_textures_path, status: :see_other, notice: "Rhizomorph texture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rhizomorph_texture
      @rhizomorph_texture = RhizomorphTexture.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def rhizomorph_texture_params
    params.require(rhizomorph_texture: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
