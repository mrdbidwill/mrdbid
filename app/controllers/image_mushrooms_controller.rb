class ImageMushroomsController < ApplicationController
  before_action :set_image_mushroom, only: %i[ show edit update destroy ]

  # GET /image_mushrooms or /image_mushrooms.json
  def index
    @image_mushrooms = ImageMushroom.all
  end

  # GET /image_mushrooms/1 or /image_mushrooms/1.json
  def show
  end

  # GET /image_mushrooms/new
  def new
    @image_mushroom = ImageMushroom.new
  end

  # GET /image_mushrooms/1/edit
  def edit
  end

  # POST /image_mushrooms or /image_mushrooms.json
  def create
    @image_mushroom = ImageMushroom.new(image_mushroom_params)

    respond_to do |format|
      if @image_mushroom.save
        format.html { redirect_to @image_mushroom, notice: "Image mushroom was successfully created." }
        format.json { render :show, status: :created, location: @image_mushroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image_mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_mushrooms/1 or /image_mushrooms/1.json
  def update
    respond_to do |format|
      if @image_mushroom.update(image_mushroom_params)
        format.html { redirect_to @image_mushroom, notice: "Image mushroom was successfully updated." }
        format.json { render :show, status: :ok, location: @image_mushroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image_mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_mushrooms/1 or /image_mushrooms/1.json
  def destroy
    @image_mushroom.destroy!

    respond_to do |format|
      format.html { redirect_to image_mushrooms_path, status: :see_other, notice: "Image mushroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_mushroom
      @image_mushroom = ImageMushroom.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def image_mushroom_params
      params.expect(image_mushroom: [ :mushroom_id_id, :parts_id, :description, :image_name, :file_address, :image_width, :image_height, :camera_make_id, :camera_model, :lens, :exposure, :aperture, :iso, :date_taken, :focal_length, :GPSLatitudeRef, :GPSLatitude_0, :GPSLatitude_1, :GPSLatitude_2, :GPSLongitudeRef, :GPSLongitude_0, :GPSLongitude_1, :GPSLongitude_2, :GPSAltitudeRef, :GPSAltitude, :entered_by_id ])
    end
end
