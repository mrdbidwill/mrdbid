class MyceliumTexturesController < ApplicationController
  before_action :set_mycelium_texture, only: %i[ show edit update destroy ]

  # GET /mycelium_textures or /mycelium_textures.json
  def index
    @mycelium_textures = MyceliumTexture.all
  end

  # GET /mycelium_textures/1 or /mycelium_textures/1.json
  def show
  end

  # GET /mycelium_textures/new
  def new
    @mycelium_texture = MyceliumTexture.new
  end

  # GET /mycelium_textures/1/edit
  def edit
  end

  # POST /mycelium_textures or /mycelium_textures.json
  def create
    @mycelium_texture = MyceliumTexture.new(mycelium_texture_params)

    respond_to do |format|
      if @mycelium_texture.save
        format.html { redirect_to @mycelium_texture, notice: "Mycelium texture was successfully created." }
        format.json { render :show, status: :created, location: @mycelium_texture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mycelium_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mycelium_textures/1 or /mycelium_textures/1.json
  def update
    respond_to do |format|
      if @mycelium_texture.update(mycelium_texture_params)
        format.html { redirect_to @mycelium_texture, notice: "Mycelium texture was successfully updated." }
        format.json { render :show, status: :ok, location: @mycelium_texture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mycelium_texture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mycelium_textures/1 or /mycelium_textures/1.json
  def destroy
    @mycelium_texture.destroy!

    respond_to do |format|
      format.html { redirect_to mycelium_textures_path, status: :see_other, notice: "Mycelium texture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mycelium_texture
      @mycelium_texture = MyceliumTexture.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mycelium_texture_params
    params.require(mycelium_texture: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
