class MrCharacterMushroomsController < ApplicationController
  # Add Pundit if you authorize mushrooms; ensure policy permits linking characters
  before_action :set_mushroom
  skip_after_action :verify_authorized, raise: false

  def create
    # Upsert behavior: one value per mushroom+character, update if exists
    @rc = MrCharacterMushroom.find_or_initialize_by(
      mushroom_id: @mushroom.id,
      mr_character_id: params[:mr_character_id]
    )

    raw_value = params[:character_value]
    if booleanish_display_option?(params[:mr_character_id])
      @rc.character_value = normalize_boolean_string(raw_value)
    else
      @rc.character_value = raw_value
    end

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

  # Boolean helpers

  def booleanish_display_option?(mr_character_id)
    mc = MrCharacter.includes(:display_option).find_by(id: mr_character_id)
    return false unless mc&.display_option&.name
    %w[boolean_yes_no boolean_true_false boolean_present_absent checkbox].include?(mc.display_option.name)
  end

  def normalize_boolean_string(value)
    v = value.to_s.strip.downcase
    return "true"  if %w[true yes present y on 1 checked].include?(v)
    return "false" if %w[false no absent n off 0 unchecked].include?(v)
    # Fallback: empty becomes false, anything else stays as-is to avoid data loss
    return "false" if v.blank?
    value.to_s
  end
end