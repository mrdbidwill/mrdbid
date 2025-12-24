class MushroomSearchController < ApplicationController
  before_action :authenticate_user!

  # Skip Pundit verification - uses policy_scope! inline
  skip_after_action :verify_authorized, raise: false

  def index
    @query = params[:q]
    @fungus_type_id = params[:fungus_type_id]
    @character_filters = params[:characters]&.to_unsafe_h || {}

    # Use query object for clean, testable search logic
    @mushrooms = MushroomSearchQuery.new(Pundit.policy_scope!(current_user, Mushroom))
                   .non_templates
                   .search(@query)
                   .by_fungus_type(@fungus_type_id)
                   .by_characters(@character_filters)
                   .with_associations
                   .results
                   .page(params[:page])
                   .per(20)

    # Get available fungus types for filter dropdown
    @fungus_types = FungusType.order(:name)

    # Get commonly searched characters for filter options
    @common_characters = MrCharacter
                          .where(display_option_id: [2, 3, 4, 5, 6])
                          .order(:name)
                          .limit(50)
  end
end
