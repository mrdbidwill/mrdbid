class PagesController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  skip_after_action :verify_authorized, raise: false

  def home
    # Fetch all mushrooms for public viewing (non-authenticated users)
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

    short_articles = Article.published.where(slug: Article::HOMEPAGE_SHORT_ARTICLE_SLUGS).index_by(&:slug)
    @home_short_articles = Article::HOMEPAGE_SHORT_ARTICLE_SLUGS.filter_map { |slug| short_articles[slug] }
  end

  def contact
  end

  def about
  end

  def demo
    @character_count = MrCharacter.count
    @lookup_item_count = LookupItem.count
    @inaturalist_field_count = InaturalistObservationField.count

    sample_names = %w[
      cap_width_mm
      cap_color
      cap_surface_texture
      gill_attachment
      stem_length_mm
      spore_print_color
    ]

    @sample_characters = MrCharacter
                           .includes(:part, :observation_method, :display_option, :lookup_items)
                           .where(name: sample_names)
                           .order(:name)
  end

  def privacy
  end

  def trees_of_blakeley_signs
  end

  def terms
  end
end
