# frozen_string_literal: true

module MushroomsHelper
  def display_option_key(character)
    (character.display_option&.name&.downcase.presence) || character.display_option_id.to_s
  end

  def character_value_summary(character_mushroom)
    character = character_mushroom.mr_character
    key = display_option_key(character)

    case key
    when "color", "6"
      names = character_mushroom.ordered_colors.map(&:common_name)
      names.any? ? names.join(", ") : "No colors selected"
    when "radio", "9", "drop-down", "10"
      LookupItem.find_by(id: character_mushroom.character_value)&.name || character_mushroom.character_value
    when "boolean_yes_no"
      character_mushroom.character_value.to_s.downcase == "true" ? "Yes" : "No"
    when "boolean_true_false"
      character_mushroom.character_value.to_s.downcase == "true" ? "True" : "False"
    when "boolean_present_absent", "checkbox"
      character_mushroom.character_value.to_s.downcase == "true" ? "Present" : "Absent"
    else
      character_mushroom.character_value.presence || "Not set"
    end
  end
end
