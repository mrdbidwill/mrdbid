class MushroomsController < ApplicationController
  before_action :set_mushroom, only: %i[show edit update destroy]
  before_action :authorize_mushroom, only: %i[edit update destroy]

  # GET /mushrooms or /mushrooms.json
  def index
    @user_mushrooms = current_user.mushrooms # Mushrooms the user owns
    # @shared_mushrooms = Mushroom.where.not(user_id: current_user.id) # Mushrooms owned by others
  end

  # GET /mushrooms/1 or /mushrooms/1.json
  def show
    # Check if the user can edit (user owns the mushroom)
    @can_edit = @mushroom.user_id == current_user.id
  end

  # GET /mushrooms/new
  def new
    @mushroom = Mushroom.new
  end

  # POST /mushrooms or /mushrooms.json
  def create
    @mushroom = current_user.mushrooms.build(mushroom_params)

    if @mushroom.save
      redirect_to @mushroom, notice: "Mushroom was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /mushrooms/1/edit
  def edit
    # Authorization already handled by `authorize_mushroom`
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
    @mushroom.destroy!
    redirect_to mushrooms_path, status: :see_other, notice: "Mushroom was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mushroom
    @mushroom = Mushroom.find(params[:id])
  end

  def authorize_mushroom
    unless @mushroom.user_id == current_user.id
      redirect_to mushrooms_path, alert: "You are not authorized to perform this action."
    end
  end

  # Only allow a list of trusted parameters through.
  def mushroom_params
    params.require(:mushroom).permit(:name, :description, :comment)
  end
end
