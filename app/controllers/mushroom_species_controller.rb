# frozen_string_literal: true

class MushroomSpeciesController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, raise: false

  # POST /mushroom_species.json
  def create
    @ms = MushroomSpecies.new(mushroom_species_params)
    Pundit.authorize(current_user, @ms, :create?)
    if @ms.save
      render json: { success: true, id: @ms.id }, status: :created
    else
      render json: { success: false, errors: @ms.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    render json: { success: false, errors: ["This species is already associated with this mushroom"] }, status: :unprocessable_entity
  end

  # DELETE /mushroom_species/destroy_by_relation.json
  def destroy_by_relation
    @ms = MushroomSpecies.find_by(mushroom_id: params[:mushroom_id], species_id: params[:species_id])
    if @ms
      Pundit.authorize(current_user, @ms, :destroy?)
      @ms.destroy
      render json: { success: true }
    else
      render json: { success: false, message: "Not found" }, status: :not_found
    end
  end

  private

  def mushroom_species_params
    params.require(:mushroom_species).permit(:mushroom_id, :species_id)
  end
end
