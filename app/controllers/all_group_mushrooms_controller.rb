class AllGroupMushroomsController < ApplicationController
  before_action :set_all_group_mushroom, only: %i[ show edit update destroy ]
  def index
    @all_group_mushrooms = AllGroupMushroom.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_all_group_mushroom
    @all_group = AllGroupMushroom.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def all_group_mushroom_params
    params.require(:all_group_mushroom).permit(
      :mushroom_id,
      :all_group_id
    )
  end
end
