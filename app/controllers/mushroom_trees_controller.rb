# frozen_string_literal: true

class MushroomTreesController < ApplicationController
  before_action :authenticate_user!

  # POST /mushroom_trees.json
  def create
    mushroom = Mushroom.find(mushroom_tree_params[:mushroom_id])

    result = Associations::Creator.call(
      user: current_user,
      parent: mushroom,
      association_class: MushroomTree,
      attributes: mushroom_tree_params
    )

    if result.success?
      render json: { success: true, id: result.data.id }, status: :created
    else
      errors = result.data.is_a?(MushroomTree) ? result.data.errors.full_messages : [result.error]
      render json: { success: false, errors: errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, errors: ["Mushroom not found"] }, status: :not_found
  rescue ActiveRecord::RecordNotUnique
    render json: { success: false, errors: ["This tree is already associated with this mushroom"] }, status: :unprocessable_entity
  end

  # DELETE /mushroom_trees/destroy_by_relation.json
  def destroy_by_relation
    mushroom = Mushroom.find(params[:mushroom_id])

    result = Associations::Destroyer.call(
      user: current_user,
      parent: mushroom,
      association_class: MushroomTree,
      related_id: params[:tree_id]
    )

    if result.success?
      render json: { success: true }
    else
      render json: { success: false, message: result.error }, status: :not_found
    end
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, message: "Mushroom not found" }, status: :not_found
  end

  private

  def mushroom_tree_params
    params.require(:mushroom_tree).permit(:mushroom_id, :tree_id)
  end
end
