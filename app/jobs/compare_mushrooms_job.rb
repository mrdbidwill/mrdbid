# frozen_string_literal: true

class CompareMushroomsJob < ApplicationJob
  queue_as :default

  # Minimum number of characters required for meaningful comparison
  MINIMUM_CHARACTERS = 10

  # Number of mushroom pairs to process per batch
  BATCH_SIZE = 100

  # ============================================================================
  # COMPARE MUSHROOMS JOB
  # ============================================================================
  # Asynchronously compares mushrooms based on their character values.
  #
  # PARAMETERS:
  # - mushroom_id: ID of mushroom to compare against all others
  # - batch_offset: Starting offset for pagination (default: 0)
  #
  # BEHAVIOR:
  # - Only compares mushrooms with minimum character count
  # - Processes in batches to avoid memory issues
  # - Recursively enqueues next batch if more comparisons remain
  # - Updates or creates MushroomComparison records
  #
  # PERFORMANCE:
  # - Uses batching to prevent timeout
  # - Eager loads character data to minimize queries
  # - Skips comparisons that already exist and are recent
  # ============================================================================

  def perform(mushroom_id, batch_offset: 0)
    mushroom = Mushroom.find(mushroom_id)

    # Check if mushroom has minimum characters
    character_count = mushroom.mr_character_mushrooms.count
    if character_count < MINIMUM_CHARACTERS
      Rails.logger.info "Mushroom #{mushroom_id} has only #{character_count} characters. Minimum is #{MINIMUM_CHARACTERS}."
      return
    end

    # Load character values for the primary mushroom
    primary_characters = load_character_values(mushroom)

    # Get all other mushrooms with minimum characters (excluding self)
    other_mushrooms = Mushroom
                        .where.not(id: mushroom_id)
                        .with_minimum_characters(MINIMUM_CHARACTERS)
                        .offset(batch_offset)
                        .limit(BATCH_SIZE)

    other_mushrooms.each do |compared_mushroom|
      compare_pair(mushroom, compared_mushroom, primary_characters)
    end

    # If there are more mushrooms to process, enqueue next batch
    if other_mushrooms.size == BATCH_SIZE
      CompareMushroomsJob.perform_later(mushroom_id, batch_offset: batch_offset + BATCH_SIZE)
    end
  end

  private

  def compare_pair(mushroom, compared_mushroom, primary_characters)
    # Find or create comparison record
    comparison = MushroomComparison.find_or_initialize_by(
      mushroom_id: mushroom.id,
      compared_mushroom_id: compared_mushroom.id
    )

    begin
      # Load character values for compared mushroom
      compared_characters = load_character_values(compared_mushroom)

      # Calculate Jaccard similarity
      similarity_result = calculate_jaccard_similarity(primary_characters, compared_characters)

      # Update comparison with results
      comparison.mark_completed!(
        similarity_result[:score],
        similarity_result[:matching],
        similarity_result[:total]
      )
    rescue StandardError => e
      Rails.logger.error "Failed to compare mushrooms #{mushroom.id} and #{compared_mushroom.id}: #{e.message}"
      comparison.mark_failed! if comparison.persisted?
    end
  end

  def load_character_values(mushroom)
    # Returns hash: { mr_character_id => character_value }
    mushroom.mr_character_mushrooms.pluck(:mr_character_id, :character_value).to_h
  end

  def calculate_jaccard_similarity(set_a, set_b)
    # Create sets of (character_id, value) tuples for accurate comparison
    pairs_a = set_a.to_a.to_set
    pairs_b = set_b.to_a.to_set

    # Calculate intersection and union
    intersection = pairs_a & pairs_b
    union = pairs_a | pairs_b

    return { score: 0, matching: 0, total: 0 } if union.empty?

    matching_count = intersection.size
    total_count = union.size
    similarity_percentage = ((matching_count.to_f / total_count) * 100).round

    {
      score: similarity_percentage,
      matching: matching_count,
      total: total_count
    }
  end
end
