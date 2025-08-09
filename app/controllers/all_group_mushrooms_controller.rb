# This controller manages the pivot table all_group_mushrooms between all_groups and mushrooms
#  which allows a user to add a mushroom object to an all_group

class AllGroupMushroomsController < ApplicationController
  include Pundit::Authorization

  before_action :set_and_authorize_all_group_mushroom, only: %i[ show edit update destroy ]
  before_action :authorize_new_all_group_mushroom, only: %i[new create]

  def index
    @all_group_mushrooms = policy_scope(AllGroupMushroom)
  end

  def show
  end

  def new
    @mushroom = Mushroom.find(params[:mushroom_id])  if params[:mushroom_id] # Fetch the mushroom from the route
    @all_group_mushroom = AllGroupMushroom.new
    @all_groups = AllGroup.all # Fetch all available groups (or scope to the current user if necessary)
  end
  def create
    @mushroom = current_user.mushrooms.find(params[:mushroom_id])
    @all_group = current_user.all_groups.find(params[:all_group_mushroom][:all_group_id])

    # Authorize at the record/resource level
    authorize @all_group

    @all_group_mushroom = AllGroupMushroom.new(mushroom: @mushroom, all_group: @all_group)

    if @all_group_mushroom.save
      redirect_to mushrooms_path, notice: "Mushroom successfully added to the group."
    else
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
  def set_and_authorize_all_group_mushroom
    @all_group_mushroom = authorize current_user.all_group_mushrooms.find(params[:id])
  end

  def authorize_new_all_group_mushroom
    authorize AllGroupMushroom
  end


  # Only allow a list of trusted parameters through.
  def all_group_mushroom_params
    params.require(:all_group_mushroom).permit(
      :mushroom_id,
      :all_group_id
    )
  end
end
