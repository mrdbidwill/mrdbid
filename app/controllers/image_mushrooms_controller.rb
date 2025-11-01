class ImageMushroomsController < ApplicationController

  include Pundit::Authorization
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_image_mushroom, only: %i[show edit update destroy]

  def index
    @image_mushrooms = policy_scope(ImageMushroom).includes(:mushroom, :part)
  end


  def show
  end

  def new
    @mushroom = Mushroom.find_by(id: params[:mushroom_id]) # Optional mushroom from params
    unless @mushroom
      redirect_to mushrooms_path, alert: "You must choose a mushroom first." and return
    end
    authorize @mushroom, :mushroom_image_mushroom?
    @image_mushroom = ImageMushroom.new
    @image_mushroom.mushroom_id = @mushroom.id
    @parts = Part.all.order(:name)
  end


  def create
    @image_mushroom = ImageMushroom.new(image_mushroom_params)

    # Prefer nested route param, else fall back to hidden field
    route_parent_id = params[:mushroom_id].presence
    form_parent_id  = image_mushroom_params[:mushroom_id].presence
    parent_id = route_parent_id || form_parent_id

    if parent_id.blank?
      redirect_to mushrooms_path, alert: "You must choose a mushroom first." and return
    end

    @image_mushroom.mushroom_id = parent_id

    @mushroom = Mushroom.find_by(id: @image_mushroom.mushroom_id)
    authorize @mushroom, :mushroom_image_mushroom? if @mushroom

    if @image_mushroom.save
      redirect_to mushroom_path(@image_mushroom.mushroom_id), notice: "Image successfully uploaded."
    else
      @parts = Part.all.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @image_mushroom
    @mushrooms = Mushroom.all
    @parts = Part.all
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
    redirect_to mushroom_path(parent_id), notice: 'Image was successfully deleted.'
  end

  private

  def set_image_mushroom
    # Eager load all associations used in views and disable strict loading for this record
    @image_mushroom = ImageMushroom.includes(:mushroom, :part).find(params[:id])
    @image_mushroom.strict_loading!(false) if @image_mushroom.respond_to?(:strict_loading!)
  end

  # Only allow a list of trusted parameters through.
  def image_mushroom_params
    params.require(:image_mushroom).permit(
      :mushroom_id,
      :part_id,
      :image_name,
      :image_file
    )
  end
end
