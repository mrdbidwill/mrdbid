class MushroomSearchController < ApplicationController
  before_action :authenticate_user!

  def index
    @query = params[:q]
    @fungus_type_id = params[:fungus_type_id]
    @character_filters = params[:characters]&.to_h || {}

    # Start with user's mushrooms
    @mushrooms = current_user.mushrooms.non_templates
                   .includes(:fungus_type, :country, :state, :genera, :species,
                             image_mushrooms: [:part, { image_file_attachment: :blob }])

    # Apply text search if query present
    if @query.present?
      @mushrooms = @mushrooms.fulltext_search(@query)
    end

    # Filter by fungus type
    if @fungus_type_id.present?
      @mushrooms = @mushrooms.where(fungus_type_id: @fungus_type_id)
    end

    # Filter by characters - handle nested hash structure from dynamic form
    if @character_filters.present? && @character_filters.any?
      @character_filters.each do |key, value|
        # Handle both direct character_id=>value pairs and nested new_X hashes
        if value.is_a?(Hash) && value['character_id'].present? && value['value'].present?
          # Dynamic filter: {new_1: {character_id: "5", value: "red"}}
          @mushrooms = @mushrooms.with_character(value['character_id'], value['value'])
        elsif value.present? && !value.is_a?(Hash)
          # Direct filter: {character_id: value}
          @mushrooms = @mushrooms.with_character(key, value)
        end
      end
    end

    @mushrooms = @mushrooms.distinct
                   .page(params[:page])
                   .per(20)

    # Get available fungus types for filter dropdown
    @fungus_types = FungusType.order(:name)

    # Get commonly searched characters for filter options
    @common_characters = MrCharacter
                          .where(display_option_id: [2, 3, 4, 5, 6]) # Exclude "do not display"
                          .order(:name)
                          .limit(50)
  end
end
