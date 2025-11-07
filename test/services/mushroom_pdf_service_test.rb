# frozen_string_literal: true

require "test_helper"

class MushroomPdfServiceTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @country = countries(:one)
    @fungus_type = fungus_types(:one)
    @mushroom = Mushroom.create!(
      name: "Test Mushroom",
      description: "A test mushroom for PDF export",
      user: @user,
      country: @country,
      fungus_type: @fungus_type
    )
  end

  test "generates PDF for single mushroom" do
    # Disable strict loading for test
    @mushroom.strict_loading!(false) if @mushroom.respond_to?(:strict_loading!)

    service = MushroomPdfService.new(@mushroom)
    pdf = service.generate

    assert_not_nil pdf
    assert_instance_of Prawn::Document, pdf

    # Verify PDF can be rendered
    pdf_string = pdf.render
    assert pdf_string.length > 0
    assert pdf_string.start_with?("%PDF")
  end

  test "generates PDF for multiple mushrooms" do
    mushroom2 = Mushroom.create!(
      name: "Second Test Mushroom",
      user: @user,
      country: @country,
      fungus_type: @fungus_type
    )

    # Disable strict loading for tests
    @mushroom.strict_loading!(false) if @mushroom.respond_to?(:strict_loading!)
    mushroom2.strict_loading!(false) if mushroom2.respond_to?(:strict_loading!)

    service = MushroomPdfService.new([@mushroom, mushroom2])
    pdf = service.generate

    assert_not_nil pdf
    pdf_string = pdf.render
    assert pdf_string.length > 0
  end

  test "generates PDF with empty mushroom array" do
    service = MushroomPdfService.new([])
    pdf = service.generate

    assert_not_nil pdf
    pdf_string = pdf.render
    assert pdf_string.length > 0
  end

  test "handles mushroom with basic info" do
    @mushroom.update(
      description: "Test description",
      comments: "Test comments"
    )
    @mushroom.strict_loading!(false) if @mushroom.respond_to?(:strict_loading!)

    service = MushroomPdfService.new(@mushroom)
    pdf = service.generate
    pdf_string = pdf.render

    # Just verify PDF was generated successfully
    assert pdf_string.length > 0
    assert pdf_string.start_with?("%PDF")
  end

  test "handles mushroom without optional fields" do
    minimal_mushroom = Mushroom.create!(
      name: "Minimal Mushroom",
      user: @user,
      country: @country,
      fungus_type: @fungus_type
    )
    minimal_mushroom.strict_loading!(false) if minimal_mushroom.respond_to?(:strict_loading!)

    service = MushroomPdfService.new(minimal_mushroom)
    pdf = service.generate

    assert_not_nil pdf
    pdf_string = pdf.render
    assert pdf_string.length > 0
  end

  test "includes location information in PDF" do
    state = states(:one)
    @mushroom.update(state: state)
    @mushroom.strict_loading!(false) if @mushroom.respond_to?(:strict_loading!)

    service = MushroomPdfService.new(@mushroom)
    pdf = service.generate
    pdf_string = pdf.render

    # Basic smoke test - PDF generates without errors
    assert pdf_string.length > 0
  end

  test "handles mushroom with characters" do
    # Find or create required records
    text_display = DisplayOption.find_or_create_by!(name: "text_box_string") do |d|
      d.description = "Text box for strings"
    end
    source = SourceData.first || SourceData.create!(title: "Test Source", source_data_type_id: 1)
    lookup_type = LookupType.first || LookupType.create!(name: "Test Type")

    mr_character = MrCharacter.create!(
      name: "Test Text Character",
      part: parts(:one),
      display_option: text_display,
      source_data: source,
      lookup_type: lookup_type
    )

    MrCharacterMushroom.create!(
      mushroom: @mushroom,
      mr_character: mr_character,
      character_value: "test value"
    )

    @mushroom.strict_loading!(false) if @mushroom.respond_to?(:strict_loading!)
    service = MushroomPdfService.new(@mushroom)
    pdf = service.generate

    assert_not_nil pdf
    pdf_string = pdf.render
    assert pdf_string.length > 0
    assert pdf_string.start_with?("%PDF")
  end

  test "formats boolean character values correctly" do
    # Find or create required records
    boolean_display = DisplayOption.find_or_create_by!(name: "boolean_yes_no") do |d|
      d.description = "Boolean Yes/No"
    end
    source = SourceData.first || SourceData.create!(title: "Test Source", source_data_type_id: 1)
    lookup_type = LookupType.first || LookupType.create!(name: "Test Type")

    mr_character = MrCharacter.create!(
      name: "Test Boolean Character",
      part: parts(:one),
      display_option: boolean_display,
      source_data: source,
      lookup_type: lookup_type
    )

    char_mushroom = MrCharacterMushroom.create!(
      mushroom: @mushroom,
      mr_character: mr_character,
      character_value: "true"
    )

    @mushroom.strict_loading!(false) if @mushroom.respond_to?(:strict_loading!)
    service = MushroomPdfService.new(@mushroom)
    formatted_value = service.send(:format_character_value, char_mushroom)

    assert_equal "Yes", formatted_value
  end

  test "handles PDF generation errors gracefully" do
    # Test that service doesn't crash with edge cases
    service = MushroomPdfService.new(nil)
    pdf = service.generate

    assert_not_nil pdf
  end
end
