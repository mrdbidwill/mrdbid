# frozen_string_literal: true

class MushroomTreesController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, raise: false

  # POST /mushroom_trees.json
  def create
    @mushroom_tree = MushroomTree.new(mushroom_tree_params)
    authorize @mushroom_tree if respond_to?(:authorize)
    if @mushroom_tree.save
      render json: { success: true, id: @mushroom_tree.id }, status: :created
    else
      render json: { success: false, errors: @mushroom_tree.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    render json: { success: false, errors: ["This tree is already associated with this mushroom"] }, status: :unprocessable_entity
  end

  # DELETE /mushroom_trees/destroy_by_relation.json
  def destroy_by_relation
    @mushroom_tree = MushroomTree.find_by(mushroom_id: params[:mushroom_id], tree_id: params[:tree_id])
    if @mushroom_tree && ( !respond_to?(:authorize) || authorize(@mushroom_tree) )
      @mushroom_tree.destroy
      render json: { success: true }
    else
      render json: { success: false, message: "Not found" }, status: :not_found
    end
  end

  private

  def mushroom_tree_params
    params.require(:mushroom_tree).permit(:mushroom_id, :tree_id)
  end
end
