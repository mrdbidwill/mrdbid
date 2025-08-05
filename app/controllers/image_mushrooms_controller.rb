class ImageMushroomsController < ApplicationController
  before_action :set_image_mushroom, only: %i[show edit update destroy]

  def index
    @image_mushrooms = ImageMushroom.includes(:mushroom, :part, :camera_make, :camera_model)
  end

  def show
  end

  def new
    @mushroom = Mushroom.find(params[:mushroom_id]) # Retrieve the mushroom from params
    @image_mushroom = ImageMushroom.new
    @parts = Part.all.order(:name)
    @camera_makes = CameraMake.all.order(:name)
    @camera_models = CameraModel.all.order(:name)
  end

  def create
    @image_mushroom = ImageMushroom.new(image_mushroom_params)
    @image_mushroom.mushroom_id = params[:mushroom_id]
    @mushroom = Mushroom.find(params[:mushroom_id]) # Set @mushroom explicitly for the view

    if @image_mushroom.save
      redirect_to mushroom_path(params[:mushroom_id]), notice: "Image successfully uploaded."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @mushrooms = Mushroom.all
    @parts = Part.all
    @camera_makes = CameraMake.all
    @camera_models = CameraModel.all
  end

  def update
    if @image_mushroom.update(image_mushroom_params)
      redirect_to @image_mushroom, notice: 'Image Mushroom was successfully updated.'
    else
      # Reload data for form rendering
      @mushrooms = Mushroom.all
      @parts = Part.all
      @camera_makes = CameraMake.all
      @camera_models = CameraModel.all
      render :edit
    end
  end

  def destroy
    @image_mushroom.destroy
    redirect_to image_mushrooms_url, notice: 'Image Mushroom was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image_mushroom
    @image_mushroom = ImageMushroom.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def image_mushroom_params
    params.require(:image_mushroom).permit(
      :mushroom_id,
      :part_id,
      :image_name,
      :image_file,   # Permit the new `image_file` attachment - Active Storage
      :image_width,
      :image_height,
      :camera_make_id,
      :camera_model_id,
      :lens,
      :exposure,
      :aperture,
      :iso
    )
  end
end
