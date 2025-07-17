class ImageMushroomsController < ApplicationController
  before_action :set_image_mushroom, only: %i[show edit update destroy]

  def index
    @image_mushrooms = ImageMushroom.includes(:mushroom, :part, :camera_make, :camera_model)
  end

  def show
  end

  def new
    @image_mushroom = ImageMushroom.new
    @mushrooms = Mushroom.all
    @lookup_parts = LookupItem.by_type('part') # Assuming a scope exists for parts
    @camera_makes = LookupItem.by_type('camera_make') # Assuming a scope exists
    @camera_models = LookupItem.by_type('camera_model') # Assuming a scope exists
  end

  def create
    @image_mushroom = ImageMushroom.new(image_mushroom_params)

    if @image_mushroom.save
      redirect_to @image_mushroom, notice: 'Image Mushroom was successfully created.'
    else
      # Load dropdowns again in case save fails
      @mushrooms = Mushroom.all
      @lookup_parts = LookupItem.by_type('part')
      @camera_makes = LookupItem.by_type('camera_make')
      @camera_models = LookupItem.by_type('camera_model')
      render :new
    end
  end

  def edit
    @mushrooms = Mushroom.all
    @lookup_parts = LookupItem.by_type('part')
    @camera_makes = LookupItem.by_type('camera_make')
    @camera_models = LookupItem.by_type('camera_model')
  end

  def update
    if @image_mushroom.update(image_mushroom_params)
      redirect_to @image_mushroom, notice: 'Image Mushroom was successfully updated.'
    else
      # Reload data for form rendering
      @mushrooms = Mushroom.all
      @lookup_parts = LookupItem.by_type('part')
      @camera_makes = LookupItem.by_type('camera_make')
      @camera_models = LookupItem.by_type('camera_model')
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
      :camera_make_id,
      :camera_model_id,
      :image_name,
      :image_file_address,
      :image_width,
      :image_height,
      :lens,
      :exposure,
      :aperture,
      :iso
    )
  end
end
