class PagesController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  skip_after_action :verify_authorized, raise: false

  def home
    # Fetch all mushrooms for public preview (non-authenticated users)
    # Optimized query with eager loading to prevent N+1 queries
    # Only load essential associations for display
    @mushrooms = Mushroom.all
                   .includes(:fungus_type, :country, :state, :genera, { species: :genus },
                             image_mushrooms: { image_file_attachment: :blob })
                   .left_joins(:fungus_type)
                   .select('mushrooms.*', 'fungus_types.name as fungus_type_name')
                   .order(Arel.sql('fungus_types.name IS NULL'), 'fungus_types.name', 'mushrooms.name')
                   .page(params[:page])
                   .per(10)
  end

  def contact
  end

  def trees_of_blakeley_signs
  end

  def terms
  end
end
