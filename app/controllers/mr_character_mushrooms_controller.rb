class MrCharacterMushroomsController < ApplicationController
  # Add Pundit if you authorize mushrooms; ensure policy permits linking characters
  before_action :set_mushroom

  def create
    # Upsert behavior: one value per mushroom+character, update if exists
    @rc = MrCharacterMushroom.find_or_initialize_by(
      mushroom_id: @mushroom.id,
      mr_character_id: params[:mr_character_id]
    )
    @rc.character_value = params[:character_value]
    authorize @rc if defined?(policy)

    if @rc.save
      respond_to do |format|
        format.turbo_stream { redirect_to edit_mushroom_path(@mushroom), notice: "Character saved.", status: :see_other }
        format.html { redirect_to edit_mushroom_path(@mushroom), notice: "Character saved." }
      end
    else
      respond_to do |format|
        format.turbo_stream { redirect_to edit_mushroom_path(@mushroom), alert: @rc.errors.full_messages.to_sentence, status: :see_other }
        format.html { redirect_to edit_mushroom_path(@mushroom), alert: @rc.errors.full_messages.to_sentence }
      end
    end
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:mushroom_id])
  end
end