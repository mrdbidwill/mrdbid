class MushroomsController < ApplicationController
  before_action :authenticate_user!, except: [:index] # Ensure user is authenticated first, except for index
  before_action :set_mushroom, only: %i[show edit update destroy]
  before_action :authorize_mushroom, except: %i[index new create]

  # GET /mushrooms or /mushrooms.json
  def index
    if user_signed_in?
      # Preload the `user` association to avoid strict loading violation
      @mushrooms = respond_to?(:policy_scope) ? policy_scope(Mushroom.includes(:user)) : Mushroom.where(user: current_user).includes(:user)

      # Fetch associated image mushrooms (if needed)
      @image_mushrooms = ImageMushroom.includes(:mushroom).where(mushroom: @mushrooms)
    else
      @mushrooms = [] # Empty array for non-signed-in users
      @image_mushrooms = [] # Default to empty array
    end
  end

  # GET /mushrooms/1 or /mushrooms/1.json
  def show
  end

  # GET /mushrooms/new
  def new
    @mushroom = Mushroom.new
    authorize @mushroom if respond_to?(:authorize)
  end

  # POST /mushrooms or /mushrooms.json
  def create
    @mushroom = current_user.mushrooms.build(mushroom_params)
    authorize @mushroom if respond_to?(:authorize) # Authorize before saving

    if @mushroom.save
      redirect_to @mushroom, notice: "Mushroom was successfully created."
    else
      render :new
    end
  end

  # GET /mushrooms/1/edit
  def edit
  end

  # PATCH/PUT /mushrooms/1 or /mushrooms/1.json
  def update
    if @mushroom.update(mushroom_params)
      redirect_to @mushroom, notice: "Mushroom was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mushrooms/1 or /mushrooms/1.json
  def destroy
    # Temporarily disable strict_loading for this mushroom
    @mushroom.strict_loading!(false) if @mushroom.respond_to?(:strict_loading!)
    @mushroom.destroy
    redirect_to mushrooms_path, notice: "Mushroom was successfully destroyed."
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:id])
    authorize @mushroom if respond_to?(:authorize)
  end

  # Only allow a list of trusted parameters through.
  def mushroom_params
    params.require(:mushroom).permit(:name, :description, :comment)
  end

  def authorize_mushroom
    authorize @mushroom if respond_to?(:authorize)
  end
end
