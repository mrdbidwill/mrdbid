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

    # Handle color characters differently (via join table)
    if color_character?(params[:mr_character_id])
      # Set color_ids (can be single value or array)
      color_ids = params[:color_ids].presence || [params[:character_value]].compact

      # If clearing all colors, delete the record instead of saving empty
      if color_ids.empty? && @rc.persisted?
        @rc.destroy
        redirect_path = params[:redirect_to].presence || edit_mushroom_path(@mushroom)
        redirect_to redirect_path, notice: "Character cleared.", status: :see_other
        return
      end

      @rc.color_ids = color_ids
    elsif booleanish_display_option?(params[:mr_character_id])
      @rc.character_value = normalize_boolean_string(params[:character_value])
    else
      @rc.character_value = params[:character_value]
    end

    # Determine where to redirect after save (back to grid or edit page)
    redirect_path = params[:redirect_to].presence || edit_mushroom_path(@mushroom)

    if @rc.save
      redirect_to redirect_path, notice: "Character saved.", status: :see_other
    else
      redirect_to redirect_path, alert: @rc.errors.full_messages.to_sentence, status: :see_other
    end
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:mushroom_id])
  end

  # Display option helpers

  def color_character?(mr_character_id)
    mc = MrCharacter.includes(:display_option).find_by(id: mr_character_id)
    mc&.display_option_id == 6
  end

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