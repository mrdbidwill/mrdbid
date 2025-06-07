class ImageMushroomThumbnailsController < ApplicationController
  before_action :set_image_mushroom_thumbnail, only: %i[ show edit update destroy ]

  # GET /image_mushroom_thumbnails or /image_mushroom_thumbnails.json
  def index
    @image_mushroom_thumbnails = ImageMushroomThumbnail.all
  end

  # GET /image_mushroom_thumbnails/1 or /image_mushroom_thumbnails/1.json
  def show
  end

  # GET /image_mushroom_thumbnails/new
  def new
    @image_mushroom_thumbnail = ImageMushroomThumbnail.new
  end

  # GET /image_mushroom_thumbnails/1/edit
  def edit
  end

  # POST /image_mushroom_thumbnails or /image_mushroom_thumbnails.json
  def create
    @image_mushroom_thumbnail = ImageMushroomThumbnail.new(image_mushroom_thumbnail_params)

    respond_to do |format|
      if @image_mushroom_thumbnail.save
        format.html { redirect_to @image_mushroom_thumbnail, notice: "Image mushroom thumbnail was successfully created." }
        format.json { render :show, status: :created, location: @image_mushroom_thumbnail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image_mushroom_thumbnail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_mushroom_thumbnails/1 or /image_mushroom_thumbnails/1.json
  def update
    respond_to do |format|
      if @image_mushroom_thumbnail.update(image_mushroom_thumbnail_params)
        format.html { redirect_to @image_mushroom_thumbnail, notice: "Image mushroom thumbnail was successfully updated." }
        format.json { render :show, status: :ok, location: @image_mushroom_thumbnail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image_mushroom_thumbnail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_mushroom_thumbnails/1 or /image_mushroom_thumbnails/1.json
  def destroy
    @image_mushroom_thumbnail.destroy!

    respond_to do |format|
      format.html { redirect_to image_mushroom_thumbnails_path, status: :see_other, notice: "Image mushroom thumbnail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_mushroom_thumbnail
      @image_mushroom_thumbnail = ImageMushroomThumbnail.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def image_mushroom_thumbnail_params
      params.expect(image_mushroom_thumbnail: [ :image_mushroom_id_id, :thumbnail_file_address, :image_width, :image_height, :entered_by_id ])
    end
end
