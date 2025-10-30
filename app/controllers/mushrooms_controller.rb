class MushroomsController < ApplicationController
  # Pundit setup
  include Pundit::Authorization

  before_action :authenticate_user!, except: [:index] # Ensure user is authenticated first, except for index
  before_action :set_mushroom, only: %i[show edit update destroy]
  before_action :authorize_mushroom, except: %i[index new create]

  # GET /mushrooms
  def index
    if user_signed_in?
      @mushrooms = policy_scope(Mushroom)
                     .includes(:fungus_type, :country, :state,
                               image_mushrooms: { image_file_attachment: :blob })
                     .left_joins(:fungus_type)
                     .order(Arel.sql('fungus_types.name IS NULL'), 'fungus_types.name', 'mushrooms.name')
                     .page(params[:page])
                     .per(25)
    else
      @mushrooms = []
    end
  end

  # GET /mushrooms/1 or /mushrooms/1.json
  def show
  end

  # GET /mushrooms/new
  def new
    @mushroom = Mushroom.new
    authorize @mushroom
  end

  # POST /mushrooms or /mushrooms.json
  def create
    @mushroom = current_user.mushrooms.build(mushroom_params.except(:user_id))
    authorize @mushroom # Authorize before saving

    if @mushroom.save
      redirect_to new_image_mushroom_path(mushroom_id: @mushroom.id), notice: "Mushroom was successfully created. Now add an image."
    else
      render :new
    end
  end

  # GET /mushrooms/1/edit
  def edit
    # set_mushroom before_action already loads the mushroom with basic associations
    # Reload with additional associations needed for edit view
    @mushroom = Mushroom
                  .includes(:genera, :species, :trees, :plants, mr_character_mushrooms: { mr_character: [:part, :display_option, :source_data] })
                  .find(params[:id])
    authorize @mushroom
  rescue ActiveRecord::RecordNotFound
      redirect_to mushrooms_path, alert: "Mushroom not found."
  end


  # PATCH/PUT /mushrooms/1 or /mushrooms/1.json
  def update
    # Ensure that user_id cannot be modified by removing it from params
    filtered_params = mushroom_params.except(:user_id)

    if @mushroom.update(filtered_params)
      redirect_to @mushroom, notice: "Mushroom was successfully updated."
    else
        # Reload with eager loading to avoid strict_loading violations in form
        @mushroom = Mushroom.includes(:genera).find(@mushroom.id)
        # Reload with eager loading to avoid strict_loading violations in form
        @mushroom = Mushroom.includes(:genera).find(@mushroom.id)
        # Reload with eager loading to avoid strict_loading violations in form
        @mushroom = Mushroom.includes(:genera).find(@mushroom.id)
      # Reload with eager loading to avoid strict_loading violations in form
      @mushroom = Mushroom.includes(:genera, mr_characters: [:genera, :part, :lookup_type, :color, :source_data]).find(@mushroom.id)
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mushrooms/1 or /mushrooms/1.json
  def destroy
    # Temporarily disable strict_loading for this mushroom
    @mushroom.strict_loading!(false) if @mushroom.respond_to?(:strict_loading!)
    @mushroom.destroy
    redirect_to mushrooms_path, notice: "Mushroom was successfully deleted."
  end

  private
  def set_mushroom
    @mushroom = Mushroom
                  .includes(:country, :state, :fungus_type, :genera, :species, :trees, :plants, image_mushrooms: { image_file_attachment: :blob })
                  .find(params[:id])
    authorize @mushroom
  rescue ActiveRecord::RecordNotFound
    redirect_to mushrooms_path, alert: "Mushroom not found."
  end


  # Only allow a list of trusted parameters through.
  def mushroom_params
    params.require(:mushroom).permit(:name, :description, :comments, :user_id, :country_id, :state_id, :fungus_type_id)
  end

  def authorize_mushroom
    authorize @mushroom if respond_to?(:authorize)
  end
end
