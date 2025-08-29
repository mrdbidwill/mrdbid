class ImageMushroomsController < ApplicationController

  include Pundit::Authorization
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_image_mushroom, only: %i[show edit update destroy]

  def index
    @image_mushrooms = policy_scope(ImageMushroom).includes(:mushroom, :part, :camera)
  end


  def show
  end

  def new
    @mushroom = Mushroom.find_by(id: params[:mushroom_id]) # Optional mushroom from params
    authorize @mushroom, :mushroom_image_mushroom? if @mushroom
    @image_mushroom = ImageMushroom.new
    @parts = Part.all.order(:name)
    @cameras = Camera.includes(:camera_make, :camera_model).order("camera_makes.name, camera_models.name")
  end

  def create
    # Build from top-level params; do not rely on current_user or nesting
    @image_mushroom = ImageMushroom.new(image_mushroom_params)
    # Accept optional mushroom_id provided outside nested route without touching the association
    if params[:mushroom_id].present? && @image_mushroom.mushroom_id.blank?
      @image_mushroom.mushroom_id = params[:mushroom_id]
    end
    # Authorize against the parent mushroom (ownership)
    @mushroom = Mushroom.find_by(id: @image_mushroom.mushroom_id)
    authorize @mushroom, :mushroom_image_mushroom? if @mushroom

    if @image_mushroom.save
      # Redirect using nested route without loading the association
      parent = Mushroom.new(id: @image_mushroom.mushroom_id)
      redirect_to [parent, @image_mushroom], notice: "Image successfully uploaded."
    else
      # Reload data for form rendering without touching associations
      @parts = Part.all.order(:name)
      @cameras = Camera.includes(:camera_make, :camera_model).order("camera_makes.name, camera_models.name")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @image_mushroom
    @mushrooms = Mushroom.all
    @parts = Part.all
    @cameras = Camera.includes(:camera_make, :camera_model).order("camera_makes.name, camera_models.name")
  end

  def update
    authorize @image_mushroom
    begin
      if @image_mushroom.update(image_mushroom_params)
        parent = Mushroom.new(id: @image_mushroom.mushroom_id)
        redirect_to [parent, @image_mushroom], notice: 'Image Mushroom was successfully updated.'
      else
        parent = Mushroom.new(id: @image_mushroom.mushroom_id)
        redirect_to [parent, @image_mushroom], alert: 'Changes could not be applied.'
      end
    rescue ActiveRecord::InvalidForeignKey, ActiveRecord::RecordInvalid
      parent = Mushroom.new(id: @image_mushroom.mushroom_id)
      redirect_to [parent, @image_mushroom], alert: 'Invalid change ignored.'
    end
  end

  def destroy
    authorize @image_mushroom
    parent_id = @image_mushroom.mushroom_id
    @image_mushroom.destroy
    redirect_to mushroom_image_mushrooms_url(parent_id), notice: 'Image Mushroom was successfully deleted.'
  end

  private

  def set_image_mushroom
    # Eager load all associations used in views and disable strict loading for this record
    @image_mushroom = ImageMushroom.includes(:mushroom, :part, :camera).find(params[:id])
    @image_mushroom.strict_loading!(false) if @image_mushroom.respond_to?(:strict_loading!)
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
      :camera_id,
      :lens,
      :exposure,
      :aperture,
      :iso
    )
  end
end
