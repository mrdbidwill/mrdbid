# frozen_string_literal: true

class GenusMushroomsController < ApplicationController
  before_action :authenticate_user!

  def create
    gm = GenusMushroom.find_or_initialize_by(mushroom_id: params[:mushroom_id], genus_id: params[:genus_id])
    gm.is_primary = ActiveModel::Type::Boolean.new.cast(params[:is_primary]) if params.key?(:is_primary)
    if gm.save
      respond_success(gm.mushroom, "Genus added")
    else
      respond_error(gm.mushroom, gm.errors.full_messages.to_sentence)
    end
  end

  def update
    gm = GenusMushroom.find(params[:id])
    gm.is_primary = ActiveModel::Type::Boolean.new.cast(params[:is_primary]) if params.key?(:is_primary)
    if gm.save
      respond_success(gm.mushroom, "Updated")
    else
      respond_error(gm.mushroom, gm.errors.full_messages.to_sentence)
    end
  end

  def destroy
    gm = GenusMushroom.find(params[:id])
    mushroom = gm.mushroom
    gm.destroy
    respond_success(mushroom, "Genus removed")
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