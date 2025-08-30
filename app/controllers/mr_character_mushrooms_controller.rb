class MrCharacterMushroomsController < ApplicationController
  # Add Pundit if you authorize mushrooms; ensure policy permits linking characters
  before_action :set_mushroom

  def create
    @rc = MrCharacterMushroom.new(
      mushroom_id: @mushroom.id,
      mr_character_id: params[:mr_character_id],
      character_value: params[:character_value]
    )
    authorize @rc if defined?(policy)

    if @rc.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to edit_mushroom_path(@mushroom), notice: "Character saved." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update("flash", partial: "shared/flash", locals: { alert: @rc.errors.full_messages.to_sentence }) }
        format.html { redirect_to edit_mushroom_path(@mushroom), alert: @rc.errors.full_messages.to_sentence }
      end
    end
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:mushroom_id])
  end
end