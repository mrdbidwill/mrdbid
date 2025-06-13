class PartialInnerVeilTexturesController < ApplicationController
  before_action :set_partial_inner_veil_texture, only: %i[ show edit update destroy ]

  # GET /partial_inner_veil_textures or /partial_inner_veil_textures.json
  def index
    @partial_inner_veil_textures = PartialInnerVeilTexture.all
  end

  # GET /partial_inner_veil_textures/1 or /partial_inner_veil_textures/1.json
  def show
  end

  # GET /partial_inner_veil_textures/new
  def new
    @partial_inner_veil_texture = PartialInnerVeilTexture.new
  end

  # GET /partial_inner_veil_textures/1/edit
  def edit
  end

  # POST /partial_inner_veil_textures or /partial_inner_veil_textures.json
  def create
    @partial_inner_veil_texture = PartialInnerVeilTexture.new(partial_inner_veil_texture_params)

    respond_to do |format|
      if @partial_inner_veil_texture.save
        format.html { redirect_to @partial_inner_veil_texture, notice: "Partial inner veil texture was successfully created." }
        format.json { render :show, status: :created, location: @partial_inner_veil_texture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @partial_inner_veil_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partial_inner_veil_textures/1 or /partial_inner_veil_textures/1.json
  def update
    respond_to do |format|
      if @partial_inner_veil_texture.update(partial_inner_veil_texture_params)
        format.html { redirect_to @partial_inner_veil_texture, notice: "Partial inner veil texture was successfully updated." }
        format.json { render :show, status: :ok, location: @partial_inner_veil_texture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partial_inner_veil_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partial_inner_veil_textures/1 or /partial_inner_veil_textures/1.json
  def destroy
    @partial_inner_veil_texture.destroy!

    respond_to do |format|
      format.html { redirect_to partial_inner_veil_textures_path, status: :see_other, notice: "Partial inner veil texture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partial_inner_veil_texture
      @partial_inner_veil_texture = PartialInnerVeilTexture.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def partial_inner_veil_texture_params
    params.require(partial_inner_veil_texture: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
