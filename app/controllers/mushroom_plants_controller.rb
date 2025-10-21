# frozen_string_literal: true

class MushroomPlantsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, raise: false

  # POST /mushroom_plants.json
  def create
    @mushroom_plant = MushroomPlant.new(mushroom_plant_params)
    authorize @mushroom_plant if respond_to?(:authorize)
    if @mushroom_plant.save
      render json: { success: true, id: @mushroom_plant.id }, status: :created
    else
      render json: { success: false, errors: @mushroom_plant.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    render json: { success: false, errors: ["This plant is already associated with this mushroom"] }, status: :unprocessable_entity
  end

  # DELETE /mushroom_plants/destroy_by_relation.json
  def destroy_by_relation
    @mushroom_plant = MushroomPlant.find_by(mushroom_id: params[:mushroom_id], plant_id: params[:plant_id])
    if @mushroom_plant && ( !respond_to?(:authorize) || authorize(@mushroom_plant) )
      @mushroom_plant.destroy
      render json: { success: true }
    else
      render json: { success: false, message: "Not found" }, status: :not_found
    end
  end

  private

  def mushroom_plant_params
    params.require(:mushroom_plant).permit(:mushroom_id, :plant_id)
  end
end
