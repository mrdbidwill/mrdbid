# frozen_string_literal: true

class AutocompleteController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, raise: false

  # Genera and species autocomplete now handled by mycowriter gem
  # See: /mycowriter/autocomplete/genera and /mycowriter/autocomplete/species

  # GET /autocomplete/trees.json?q=oak
  def trees
    query = params[:q].to_s.strip
    results = if query.length >= 3
                Tree
                  .where("name LIKE ?", "%#{Tree.sanitize_sql_like(query)}%")
                  .select(:id, :name)
                  .order(:name)
                  .limit(20)
                  .map { |t| { id: t.id, name: t.name } }
              else
                []
              end
    render json: results
  end

  # GET /autocomplete/plants.json?q=fern
  def plants
    query = params[:q].to_s.strip
    results = if query.length >= 3
                Plant
                  .where("name LIKE ?", "%#{Plant.sanitize_sql_like(query)}%")
                  .select(:id, :name)
                  .order(:name)
                  .limit(20)
                  .map { |p| { id: p.id, name: p.name } }
              else
                []
              end
    render json: results
  end

  # GET /autocomplete/mr_characters.json?q=pileus&mushroom_id=1
  def mr_characters
    query = params[:q].to_s.strip.downcase
    mushroom_id = params[:mushroom_id]

    results = if query.length >= 3
                # Get mushroom's fungus_type to filter characters
                mushroom = Mushroom.find_by(id: mushroom_id) if mushroom_id.present?

                # Use cached characters for speed, filtered by fungus_type
                if mushroom&.fungus_type_id.present?
                  all_chars = MrCharacter.cached_for_fungus_type(mushroom.fungus_type_id)
                else
                  all_chars = MrCharacter.cached_all_with_associations
                end

                # Filter already-entered characters for this mushroom
                if mushroom_id.present?
                  entered_ids = MrCharacterMushroom
                    .where(mushroom_id: mushroom_id)
                    .pluck(:mr_character_id)
                    .to_set
                  all_chars = all_chars.reject { |c| entered_ids.include?(c.id) }
                end

                # Search by name (case-insensitive)
                # Exclude "do not display" and "color" characters (handled separately)
                all_chars
                  .select { |c|
                    c.name.downcase.include?(query) &&
                    c.display_option_id != 1 && # exclude "do not display"
                    c.display_option_id != 6    # exclude "color" (has special UI)
                  }
                  .first(20)
                  .map { |c|
                    {
                      id: c.id,
                      name: "[#{c.part&.name}] #{c.name.tr('_', ' ')}",
                      part_name: c.part&.name
                    }
                  }
              else
                []
              end

    render json: results
  end
end