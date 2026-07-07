require "application_system_test_case"
require "securerandom"

class CoreCharacterSequenceFlowTest < ApplicationSystemTestCase
  setup do
    @admin = users(:three)
    @owner = users(:one)
    @mushroom = mushrooms(:one)
    @part = parts(:one)
    @observation_method = observation_methods(:one)
    @display_option = display_options(:text)
    @source_data = source_data(:one)
    @fungus_type = FungusType.create!(name: "core_seq_type_#{SecureRandom.hex(4)}")
    @mushroom.update!(fungus_type: @fungus_type)
  end

  test "admin can save per-fungus core sequence" do
    sign_in @admin

    char_a = create_core_character("core_seq_admin_a_#{SecureRandom.hex(4)}")
    char_b = create_core_character("core_seq_admin_b_#{SecureRandom.hex(4)}")

    visit admin_core_character_sequences_path(fungus_type_id: @fungus_type.id)

    assert_text "Sequence Core Characters"
    fill_in "core_sequences_#{char_a.id}", with: "2"
    fill_in "core_sequences_#{char_b.id}", with: "1"

    click_button "Save Core Sequence"

    assert_text "Core character sequence saved."
    assert_equal [char_b.id, char_a.id],
                 CoreCharacterSequence.where(fungus_type: @fungus_type).order(:sequence).pluck(:mr_character_id)
  end

  private

  def create_core_character(name)
    MrCharacter.create!(
      name: name,
      part: @part,
      observation_method: @observation_method,
      display_option: @display_option,
      source_data: @source_data,
      fungus_type: @fungus_type,
      properties: { "core" => true }
    )
  end
end
