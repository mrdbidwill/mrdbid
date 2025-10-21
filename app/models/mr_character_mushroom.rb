class MrCharacterMushroom < ApplicationRecord
  belongs_to :mr_character
  belongs_to :mushroom, counter_cache: true

  before_validation :normalize_boolean_character_value, if: :booleanish_display_option?

  validates :character_value, presence: true

  validate :validate_character_value_for_colors

  scope :colors_for_mushroom, ->(mushroom_id) {
    joins(:mr_character).where(
      mushroom_id: mushroom_id,
      mr_characters: { display_option_id: 6 }
    ).includes(:mr_character)
  }


  private

  def display_value
    case mr_character&.display_option&.name
    when "color"
      Color.find_by(id: character_value)&.latin_name || "Unknown Color"
    else
      character_value
    end
  end


  def booleanish_display_option?
    name = mr_character&.display_option&.name.to_s
    %w[boolean_yes_no boolean_true_false boolean_present_absent checkbox].include?(name)
  end

  def normalize_boolean_character_value
    v = character_value.to_s.strip.downcase
    self.character_value =
      if %w[true yes present y on 1 checked].include?(v)
        "true"
      elsif %w[false no absent n off 0 unchecked].include?(v)
        "false"
      else
        v.presence || "false"
      end
  end

  def validate_character_value_for_colors
    if mr_character&.display_option&.name == "color"
      unless Color.exists?(id: character_value)
        errors.add(:character_value, "must be a valid color ID")
      end
    end
  end
end

