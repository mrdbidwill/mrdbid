# frozen_string_literal: true

class GenusMushroomsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, raise: false

  # POST /genus_mushrooms.json
  def create
    @genus_mushroom = GenusMushroom.new(genus_mushroom_params)
    authorize @genus_mushroom if respond_to?(:authorize)
    if @genus_mushroom.save
      render json: { success: true, id: @genus_mushroom.id }, status: :created
    else
      render json: { success: false, errors: @genus_mushroom.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    render json: { success: false, errors: ["This genus is already associated with this mushroom"] }, status: :unprocessable_entity
  end

  # DELETE /genus_mushrooms/destroy_by_relation.json
  def destroy_by_relation
    @genus_mushroom = GenusMushroom.find_by(mushroom_id: params[:mushroom_id], genus_id: params[:genus_id])
    if @genus_mushroom && ( !respond_to?(:authorize) || authorize(@genus_mushroom) )
      @genus_mushroom.destroy
      render json: { success: true }
    else
      render json: { success: false, message: "Not found" }, status: :not_found
    end
  end

  private

  def genus_mushroom_params
    params.require(:genus_mushroom).permit(:mushroom_id, :genus_id)
  end
end
