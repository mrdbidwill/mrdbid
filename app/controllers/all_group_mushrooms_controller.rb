# This controller manages the pivot table all_group_mushrooms between all_groups and mushrooms
#  which allows a user to add a mushroom object to an all_group

class AllGroupMushroomsController < ApplicationController
  include Pundit::Authorization

  before_action :set_all_group_mushroom, only: %i[ show edit update destroy ]

  def index
    @all_group_mushrooms = AllGroupMushroom.all
  end

  def show
  end

  def new
    @mushroom = Mushroom.find(params[:mushroom_id]) if params[:mushroom_id]
    @all_group_mushroom = AllGroupMushroom.new(mushroom: @mushroom)
    # Only groups owned by the mushroom owner should be selectable
    @all_groups = if @mushroom
                   AllGroup.where(user_id: @mushroom.user_id)
                else
                  AllGroup.none
                end
  end


  def create
    @all_group_mushroom = AllGroupMushroom.new(all_group_mushroom_params)
    @mushroom = Mushroom.find_by(id: all_group_mushroom_params[:mushroom_id])
    @all_groups = @mushroom ? AllGroup.where(user_id: @mushroom.user_id) : AllGroup.none
    if @mushroom && AllGroup.where(id: @all_group_mushroom.all_group_id, user_id: @mushroom.user_id).exists? && @all_group_mushroom.save
      redirect_to all_group_mushroom_path(@all_group_mushroom), notice: "All group mushroom was successfully created."
    else
      render :new, status: :unprocessable_entity, locals: { all_group_mushroom: @all_group_mushroom, all_groups: @all_groups, mushrooms: @mushroom ? Mushroom.where(id: @mushroom.id) : Mushroom.none }
    end
  end

  def edit
    # Verify user owns the mushroom
    unless @all_group_mushroom.mushroom && @all_group_mushroom.mushroom.user_id == current_user.id
      redirect_to mushrooms_path, alert: "You can only edit your own mushroom associations."
      return
    end
  end

  def update
    # Verify user owns the mushroom
    unless @all_group_mushroom.mushroom && @all_group_mushroom.mushroom.user_id == current_user.id
      redirect_to mushrooms_path, alert: "You can only update your own mushroom associations."
      return
    end

    if @all_group_mushroom.update(all_group_mushroom_params)
      redirect_to all_group_mushroom_path(@all_group_mushroom), notice: "All group mushroom was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    # Verify user owns the mushroom
    unless @all_group_mushroom.mushroom && @all_group_mushroom.mushroom.user_id == current_user.id
      redirect_to mushrooms_path, alert: "You can only delete your own mushroom associations."
      return
    end

    @all_group_mushroom.destroy
    redirect_to mushrooms_path, notice: "That group was successfully removed."
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_all_group_mushroom
    @all_group_mushroom = AllGroupMushroom
                            .includes(:mushroom, :all_group)
                            .find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def all_group_mushroom_params
    params.require(:all_group_mushroom).permit(
      :mushroom_id,
      :all_group_id
    )
  end
end
