# frozen_string_literal: true

class MushroomSpeciesController < ApplicationController
  before_action :authenticate_user!

  def create
    ms = MushroomSpecies.find_or_initialize_by(mushroom_id: params[:mushroom_id], species_id: params[:species_id])
    ms.is_primary = ActiveModel::Type::Boolean.new.cast(params[:is_primary]) if params.key?(:is_primary)
    if ms.save
      respond_success(ms.mushroom, "Species added")
    else
      respond_error(ms.mushroom, ms.errors.full_messages.to_sentence)
    end
  end

  def update
    ms = MushroomSpecies.find(params[:id])
    ms.is_primary = ActiveModel::Type::Boolean.new.cast(params[:is_primary]) if params.key?(:is_primary)
    if ms.save
      respond_success(ms.mushroom, "Updated")
    else
      respond_error(ms.mushroom, ms.errors.full_messages.to_sentence)
    end
  end

  def destroy
    ms = MushroomSpecies.find(params[:id])
    mushroom = ms.mushroom
    ms.destroy
    respond_success(mushroom, "Species removed")
  end

  private

  def respond_success(mushroom, notice)
    respond_to do |format|
      format.turbo_stream { redirect_back fallback_location: edit_mushroom_path(mushroom), notice:, status: :see_other }
      format.html { redirect_back fallback_location: edit_mushroom_path(mushroom), notice: }
      format.json { head :ok }
    end
  end

  def respond_error(mushroom, alert)
    respond_to do |format|
      format.turbo_stream { redirect_back fallback_location: edit_mushroom_path(mushroom), alert:, status: :see_other }
      format.html { redirect_back fallback_location: edit_mushroom_path(mushroom), alert: }
      format.json { render json: { error: alert }, status: :unprocessable_entity }
    end
  end
end