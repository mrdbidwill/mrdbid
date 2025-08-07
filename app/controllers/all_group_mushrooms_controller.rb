# This controller manages the pivot table all_group_mushrooms between all_groups and mushrooms
#  which allows a user to add a mushroom object to an all_group

class AllGroupMushroomsController < ApplicationController
  before_action :set_all_group_mushroom, only: %i[ show edit update destroy ]
  def index
    @all_group_mushrooms = AllGroupMushroom.all
  end

  def show
  end

  def new
    @mushroom = Mushroom.find(params[:mushroom_id])  if params[:mushroom_id] # Fetch the mushroom from the route
    @all_group_mushroom = AllGroupMushroom.new
    @all_groups = AllGroup.all # Fetch all available groups (or scope to the current user if necessary)
  end

  def create
    @all_group_mushroom = AllGroupMushroom.new(all_group_mushroom_params)
    @all_group_mushroom.mushroom_id = params[:mushroom_id] if params[:mushroom_id]

    if @all_group_mushroom.save
      redirect_to all_group_mushroom_path(@all_group_mushroom), notice: "Mushroom successfully assigned to group."
    else
      @mushroom = Mushroom.find(params[:mushroom_id]) if params[:mushroom_id]
      @all_groups = AllGroup.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @all_group_mushroom.update(all_group_mushroom_params)
      redirect_to all_group_mushroom_path(@all_group_mushroom), notice: "All group mushroom was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @all_group_mushroom.destroy
    redirect_to all_group_mushrooms_path, notice: "All group mushroom was successfully destroyed."
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_all_group_mushroom
    @all_group_mushroom = AllGroupMushroom.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def all_group_mushroom_params
    params.require(:all_group_mushroom).permit(
      :mushroom_id,
      :all_group_id
    )
  end
end
