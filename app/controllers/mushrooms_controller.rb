class MushroomsController < ApplicationController
  # ============================================================================
  # MUSHROOMS CONTROLLER - User's Personal Mushroom Collection Management
  # ============================================================================
  # This controller manages CRUD operations for mushrooms owned by individual users.
  # Each mushroom belongs to a single user (see app/models/mushroom.rb).
  #
  # AUTHENTICATION & AUTHORIZATION:
  # - Uses Devise for authentication (authenticate_user!)
  # - Uses Pundit for authorization (see app/policies/mushroom_policy.rb)
  # - Users can only edit/delete their own mushrooms (or admin override)
  # - Signed-in and public users can view all mushrooms
  #
  # PERFORMANCE NOTES:
  # - Uses eager loading to prevent N+1 queries
  # - Index action uses pagination (25 items per page via Kaminari)
  # - All queries include necessary associations to avoid multiple DB calls
  #
  # ⚠️  CRITICAL AUTHORIZATION FLOW:
  # 1. authenticate_user! runs first (except index - allows public viewing of empty list)
  # 2. set_mushroom loads the record for show/edit/update/destroy
  # 3. authorize_mushroom checks Pundit policy (user must own the mushroom)
  # ============================================================================

  # Pundit setup
  include Pundit::Authorization

  PRIMARY_EDIT_PART_IDS = [3, 4, 5, 6, 8].freeze
  PRIMARY_EDIT_OBSERVATION_METHOD_IDS = [1, 4, 8, 3].freeze

  before_action :authenticate_user!, except: [:index, :show, :sighting_schedule] # Allow public read access for index/show/schedule
  before_action :set_mushroom, only: %i[show edit edit_matrix update destroy edit_characters clone_characters]
  before_action :authorize_mushroom, except: %i[index show sighting_schedule new create clone_characters toggle_view_mode export_all_pdf]

  # Skip Pundit verification for public actions (index when not logged in, and show)
  # and actions where authorization is handled by service objects
  skip_after_action :verify_authorized, only: [:create, :clone_characters, :toggle_view_mode, :export_all_pdf, :sighting_schedule], raise: false
  skip_after_action :verify_policy_scoped, only: [:index], if: -> { !user_signed_in? }, raise: false

  # GET /mushrooms
  def index
    @fungus_types = FungusType.order(:name)
    @selected_fungus_type_id = params[:fungus_type_id].presence

    if user_signed_in?
      # ============================================================================
      # EAGER LOADING - CRITICAL FOR RAILS 8 STRICT_LOADING
      # ============================================================================
      # Must include ALL associations used in views to prevent StrictLoadingViolationError
      # - fungus_type: Used for grouping and display
      # - country, state: Used for location display
      # - genera, species: Used for scientific name display
      # - image_mushrooms.image_file_attachment.blob: For rendering images
      # - image_mushrooms.part: Used in _image_card partial (lines 10, 15) for alt text
      #
      # ⚠️  WARNING: Adding associations to views? Update this includes!
      # Missing associations cause 500 errors in production due to strict_loading.
      # ============================================================================

      # Check if user wants to view all mushrooms or just their own
      if session[:view_all_mushrooms] == true
        @mushrooms = Mushroom.all
        @viewing_all = true
      else
        @mushrooms = policy_scope(Mushroom)
        @viewing_all = false
      end

      # Search by name, description, comments, city, genus (minimum 3 characters)
      if params[:q].present? && params[:q].strip.length >= 3
        term_raw = params[:q].to_s.strip
        term = ActiveRecord::Base.sanitize_sql_like(term_raw)
        if term_raw =~ /\A\d+\z/
          # Exact ID match
          @mushrooms = @mushrooms.where("mushrooms.id = ?", term_raw.to_i)
        else
          # Search across multiple fields
          @mushrooms = @mushrooms
            .left_joins(:genera)
            .where(
              "mushrooms.name LIKE ? OR mushrooms.description LIKE ? OR mushrooms.comments LIKE ? OR mushrooms.city LIKE ? OR genera.name LIKE ?",
              "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%"
            )
            .distinct
        end
      end

      if @selected_fungus_type_id.present?
        @mushrooms = @mushrooms.where(fungus_type_id: @selected_fungus_type_id)
      end

      @mushrooms = @mushrooms
                     .includes(:user, :fungus_type, :country, :state, :genera, { species: :genus },
                               :clusters, :all_groups, :projects,
                               image_mushrooms: [:part, { image_file_attachment: :blob }])
                     .left_joins(:fungus_type)
                     .select('mushrooms.*', 'fungus_types.name as fungus_type_name')
                     .order(Arel.sql('fungus_types.name IS NULL'), 'fungus_types.name', 'mushrooms.name')
                     .page(params[:page])
                     .per(12)
    else
      @mushrooms = Mushroom.all

      # Search by name, description, comments, city, genus (minimum 3 characters)
      if params[:q].present? && params[:q].strip.length >= 3
        term_raw = params[:q].to_s.strip
        term = ActiveRecord::Base.sanitize_sql_like(term_raw)
        if term_raw =~ /\A\d+\z/
          # Exact ID match
          @mushrooms = @mushrooms.where("mushrooms.id = ?", term_raw.to_i)
        else
          # Search across multiple fields
          @mushrooms = @mushrooms
            .left_joins(:genera)
            .where(
              "mushrooms.name LIKE ? OR mushrooms.description LIKE ? OR mushrooms.comments LIKE ? OR mushrooms.city LIKE ? OR genera.name LIKE ?",
              "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%"
            )
            .distinct
        end
      end

      if @selected_fungus_type_id.present?
        @mushrooms = @mushrooms.where(fungus_type_id: @selected_fungus_type_id)
      end

      @mushrooms = @mushrooms
                     .includes(:fungus_type, :country, :state, :genera, { species: :genus },
                               :clusters, :all_groups, :projects,
                               image_mushrooms: [:part, { image_file_attachment: :blob }])
                     .left_joins(:fungus_type)
                     .select('mushrooms.*', 'fungus_types.name as fungus_type_name')
                     .order(Arel.sql('fungus_types.name IS NULL'), 'fungus_types.name', 'mushrooms.name')
                     .page(params[:page])
                     .per(12)
    end
  end

  def export_all_pdf
    redirect_to new_users_pdf_export_path,
                notice: "PDF export now runs in the background. You'll be taken to the export status page."
  end

  # GET /mushrooms/sighting_schedule
  def sighting_schedule
    if user_signed_in?
      if session[:view_all_mushrooms] == true
        @mushrooms = Mushroom.all
        @viewing_all = true
      else
        @mushrooms = policy_scope(Mushroom)
        @viewing_all = false
      end
    else
      @mushrooms = Mushroom.all
    end

    @mushrooms = @mushrooms
                   .includes(:state, :genera, :species)
                   .left_joins(:state)
                   .where.not(collection_date: nil)
                   .order(
                     Arel.sql("MONTH(mushrooms.collection_date)"),
                     Arel.sql("states.name IS NULL"),
                     "states.name",
                     Arel.sql("mushrooms.city IS NULL"),
                     "mushrooms.city",
                     "mushrooms.name"
                   )
                   .page(params[:page])
                   .per(100)
  end

  # GET /mushrooms/1 or /mushrooms/1.json
  def show
    authorize @mushroom
  end

  # GET /mushrooms/new
  def new
    @mushroom = Mushroom.new

    # Set collection date to today by default
    @mushroom.collection_date = Date.today

    # If copying location from another mushroom, use that mushroom's location
    if params[:copy_location_from].present?
      source_mushroom = current_user.mushrooms.find_by(id: params[:copy_location_from])
      if source_mushroom
        @mushroom.country_id = source_mushroom.country_id
        @mushroom.state_id = source_mushroom.state_id
        @mushroom.city = source_mushroom.city
        @mushroom.county = source_mushroom.county
      end
    # Otherwise, pre-populate with user's default location preferences if set
    elsif current_user.default_country_id.present?
      @mushroom.country_id = current_user.default_country_id
      @mushroom.state_id = current_user.default_state_id if current_user.default_state_id.present?
      @mushroom.city = current_user.default_city if current_user.default_city.present?
      @mushroom.county = current_user.default_county if current_user.default_county.present?
    end

    authorize @mushroom
  end

  # POST /mushrooms or /mushrooms.json
  def create
    result = Mushrooms::Creator.call(
      user: current_user,
      params: mushroom_params.except(:user_id)
    )

    if result.success?
      redirect_to new_image_mushroom_path(mushroom_id: result.data.id), notice: "Mushroom was successfully created. Now add an image.", status: :see_other
    else
      # result.data contains the mushroom object (even on failure) for form re-render
      @mushroom = result.data || Mushroom.new(mushroom_params.except(:user_id))
      render :new, status: :unprocessable_entity
    end
  end

  # GET /mushrooms/1/edit
  def edit
    @mushroom = reload_mushroom_for_edit!(params[:id])
    return if performed?
  rescue ActiveRecord::RecordNotFound
      redirect_to mushrooms_path, alert: "Mushroom not found."
  end

  # GET /mushrooms/1/edit_matrix
  # New desktop/tablet-focused edit UI. Phones are redirected to the legacy edit view.
  def edit_matrix
    if small_phone_user_agent?
      legacy_params = {}
      legacy_params[:core_only] = params[:core_only] if params.key?(:core_only)
      redirect_to edit_mushroom_path(@mushroom, legacy_params), status: :see_other
      return
    end

    @mushroom = reload_mushroom_for_edit!(params[:id])
    return if performed?

    @core_only = params[:core_only].to_s != "false"
    @part_name_by_id = Part.order(:name).pluck(:id, :name).to_h
    @observation_method_name_by_id = ObservationMethod.order(:name).pluck(:id, :name).to_h

    @observation_tabs = build_edit_matrix_observation_tabs
    @active_tab_key = resolve_edit_matrix_tab_key
    @active_tab = @observation_tabs.find { |tab| tab[:key] == @active_tab_key } || @observation_tabs.first

    characters = filtered_matrix_characters
    @core_fallback = false
    if @core_only
      core_chars = characters.select(&:core?)
      if core_chars.any?
        characters = MrCharacter.sort_for_core_display(
          core_chars,
          keep_part_order: false,
          fungus_type_id: @mushroom.fungus_type_id
        )
      else
        @core_fallback = true
      end
    end

    @part_rows = build_edit_matrix_part_rows
    @matrix_rows = @part_rows.map do |row|
      {
        key: row[:key],
        title: row[:title],
        subtitle: row[:subtitle],
        part_ids: row[:part_ids],
        other_row: row[:other_row],
        entries: build_matrix_entries_for_row(characters, row, @active_tab)
      }
    end

    @entered_character_rows = @mushroom.mr_character_mushrooms
                                      .includes(mr_character: [:part, :display_option, :source_data])
                                      .index_by(&:mr_character_id)

    @images = @mushroom.image_mushrooms.select { |image| image.image_file.attached? }
    @images_by_part_id = @images.group_by(&:part_id)
    @owner_can_quick_edit_basic = user_signed_in? && current_user.id == @mushroom.user_id
    @editing_basic_field = params[:edit_basic_field].to_s
    @fungus_types = FungusType.order(:name) if @owner_can_quick_edit_basic
  rescue ActiveRecord::RecordNotFound
    redirect_to mushrooms_path, alert: "Mushroom not found."
  end

  # GET /mushrooms/1/edit_characters?observation_method_id=X&part_id=Y
  def edit_characters
    @observation_method = ObservationMethod.find(params[:observation_method_id])
    @part = Part.find(params[:part_id])
    @core_only = params[:core_only].to_s != "false"

    # Get all characters for this observation_method + part combination
    # Filter by fungus_type if set (includes universal characters with fungus_type_id = NULL)
    base_scope = if @mushroom.fungus_type_id.present?
                   MrCharacter
                     .for_fungus_type(@mushroom.fungus_type_id)
                     .where(observation_method: @observation_method, part: @part)
                 else
                   MrCharacter
                     .where(observation_method: @observation_method, part: @part)
                 end

    all_chars = base_scope.includes(:display_option, :source_data, :lookup_items).order(:name).to_a
    @all_characters_count = all_chars.size
    @core_characters_count = all_chars.count(&:core?)

    if @core_only
      core_chars = all_chars.select(&:core?)
      if core_chars.any?
        @characters = MrCharacter.sort_for_core_display(core_chars, keep_part_order: false, fungus_type_id: @mushroom.fungus_type_id)
      else
        @characters = all_chars
        @core_fallback = true
      end
    else
      @characters = all_chars
    end

    authorize @mushroom
  rescue ActiveRecord::RecordNotFound => e
    redirect_to edit_mushroom_path(@mushroom), alert: "#{e.message}"
  end


  # PATCH/PUT /mushrooms/1 or /mushrooms/1.json
  def update
    return_to_path = safe_return_to_path

    result = Mushrooms::Updater.call(
      user: current_user,
      mushroom: @mushroom,
      params: mushroom_params.except(:user_id)
    )

    if result.success?
      redirect_to(return_to_path || result.data, notice: "Mushroom was successfully updated.", status: :see_other)
    else
      if return_to_path
        redirect_to(return_to_path, alert: result.error, status: :see_other)
        return
      end

      # Reload with eager loading for edit form associations
      @mushroom = Mushroom.includes(
        :image_mushrooms,
        :fungus_type,
        :clusters,
        :all_groups,
        :projects,
        :cluster_mushrooms,
        :all_group_mushrooms,
        :mushroom_projects,
        mr_characters: [:part, :observation_method, :color, :source_data]
      ).find(@mushroom.id)
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mushrooms/1 or /mushrooms/1.json
  def destroy
    result = Mushrooms::Destroyer.call(user: current_user, mushroom: @mushroom)

    if result.success?
      redirect_to mushrooms_path, notice: "Mushroom was successfully deleted.", status: :see_other
    else
      redirect_to @mushroom, alert: result.error
    end
  end

  # POST /mushrooms/:id/clone_characters
  def clone_characters
    if params[:source_mushroom_id].blank?
      redirect_to edit_mushroom_path(@mushroom), alert: 'Please select a mushroom to clone from.'
      return
    end

    source_mushroom = Mushroom.includes(:mr_character_mushrooms).find(params[:source_mushroom_id])

    result = Mushrooms::CharacterCloner.call(
      user: current_user,
      source_mushroom: source_mushroom,
      target_mushroom: @mushroom
    )

    if result.success?
      count = result.data[:count]
      redirect_to edit_mushroom_path(@mushroom),
                  notice: "Successfully cloned #{count} characters from #{source_mushroom.name}."
    else
      redirect_to edit_mushroom_path(@mushroom), alert: result.error
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to edit_mushroom_path(@mushroom), alert: 'Source mushroom not found.'
  end

  # POST /mushrooms/toggle_view_mode
  def toggle_view_mode
    session[:view_all_mushrooms] = !session[:view_all_mushrooms]
    redirect_to mushrooms_path
  end

  private

  # ============================================================================
  # set_mushroom - Loads mushroom with all necessary associations
  # ============================================================================
  # Called by before_action for: show, edit, update, destroy
  #
  # ASSOCIATIONS PRELOADED (prevents N+1 queries):
  # - country, state, fungus_type: Basic metadata
  # - genera, species: Taxonomic classification
  # - trees, plants: Associated flora
  # - image_mushrooms: Photos attached to this mushroom
  # - image_mushrooms.image_file_attachment.blob: Active Storage blob data
  #
  # SECURITY: Pundit authorization runs after loading to verify user ownership
  #
  # ERROR HANDLING: Redirects to index if mushroom doesn't exist (not 404)
  # ============================================================================
  def set_mushroom
    @mushroom = Mushroom
                  .includes(:country, :state, :fungus_type, :genera, { species: :genus }, :trees, :plants,
                            :clusters, :all_groups, :projects,
                            :cluster_mushrooms, :all_group_mushrooms, :mushroom_projects,
                            image_mushrooms: { image_file_attachment: :blob })
                  .find(params[:id])
    # Authorization is handled by authorize_mushroom before_action
  rescue ActiveRecord::RecordNotFound
    redirect_to mushrooms_path, alert: "Mushroom not found."
  end

  # ============================================================================
  # mushroom_params - Strong parameters for mass assignment protection
  # ============================================================================
  # SECURITY NOTES:
  # - :user_id is permitted here BUT is filtered out in create/update actions
  # - This prevents users from assigning mushrooms to other users
  # - Country, state, fungus_type are foreign keys (validated by model)
  #
  # ⚠️  WARNING: Do NOT remove :user_id from the permit list - it's intentionally
  # filtered in the controller actions (see create and update methods)
  # ============================================================================
  def mushroom_params
    params.require(:mushroom).permit(:name, :description, :comments, :personal_notes, :user_id, :country_id, :state_id, :city, :county, :fungus_type_id, :collection_date)
  end

  # ============================================================================
  # authorize_mushroom - Pundit authorization check
  # ============================================================================
  # Ensures the current user has permission to perform the requested action.
  # Called by before_action for: show, edit, update, destroy
  #
  # POLICY RULES (see app/policies/mushroom_policy.rb):
  # - Users can only view/edit/delete their own mushrooms
  # - Admin users have additional privileges (if implemented)
  #
  # ERRORS: Pundit::NotAuthorizedError is rescued by ApplicationController
  # ============================================================================
  def authorize_mushroom
    authorize @mushroom
  end

  def safe_return_to_path
    candidate = params[:return_to].presence
    return nil unless candidate.is_a?(String)
    return nil unless candidate.start_with?("/")
    return nil if candidate.start_with?("//")

    candidate
  end

  def reload_mushroom_for_edit!(mushroom_id)
    # CRITICAL: species must include genus association for ranked_identifications display
    mushroom = Mushroom
               .includes(:genera, { species: :genus }, :trees, :plants, :fungus_type,
                         :clusters, :all_groups, :projects,
                         :cluster_mushrooms, :all_group_mushrooms, :mushroom_projects,
                         image_mushrooms: [:part, { image_file_attachment: :blob }],
                         mr_character_mushrooms: { mr_character: [:part, :display_option, :source_data] })
               .find(mushroom_id)

    if mushroom.fungus_type.nil?
      Rails.logger.error("Mushroom #{mushroom.id} has invalid fungus_type_id: #{mushroom.fungus_type_id}")
      redirect_to mushrooms_path, alert: "Cannot edit mushroom: invalid fungus type. Please contact an administrator."
      return
    end

    mushroom
  end

  def filtered_matrix_characters
    base_chars = if @mushroom.fungus_type_id.present?
                   MrCharacter.cached_for_fungus_type(@mushroom.fungus_type_id)
                 else
                   MrCharacter.cached_all_with_associations
                 end

    base_chars.reject do |character|
      do_not_display = character.display_option_id == 1 || character.display_option&.name&.downcase == "do not display"
      do_not_display || character.part_id == 1 || character.observation_method_id == 9
    end
  end

  def build_edit_matrix_observation_tabs
    tabs = [
      { key: "macro", label: @observation_method_name_by_id[1] || "Macro", method_ids: [1], other_tab: false },
      { key: "micro", label: @observation_method_name_by_id[4] || "Micro", method_ids: [4], other_tab: false },
      { key: "dna", label: @observation_method_name_by_id[8] || "DNA", method_ids: [8], other_tab: false },
      { key: "chemical", label: @observation_method_name_by_id[3] || "Chemical", method_ids: [3], other_tab: false }
    ]

    tabs.select! { |tab| tab[:method_ids].all? { |method_id| @observation_method_name_by_id.key?(method_id) } }

    other_ids = @observation_method_name_by_id
                  .keys
                  .reject { |method_id| PRIMARY_EDIT_OBSERVATION_METHOD_IDS.include?(method_id) || method_id == 9 }
                  .sort_by { |method_id| @observation_method_name_by_id[method_id].to_s.downcase }

    tabs << { key: "other_methods", label: "All Others", method_ids: other_ids, other_tab: true }
    tabs
  end

  def resolve_edit_matrix_tab_key
    requested = params[:observation_tab].to_s
    valid_keys = @observation_tabs.map { |tab| tab[:key] }
    valid_keys.include?(requested) ? requested : @observation_tabs.first[:key]
  end

  def build_edit_matrix_part_rows
    rows = [
      { key: "cap", title: @part_name_by_id[3] || "Cap", subtitle: "Part ID 3", part_ids: [3], other_row: false },
      { key: "gills", title: @part_name_by_id[4] || "Gills", subtitle: "Part ID 4", part_ids: [4], other_row: false },
      { key: "stem", title: @part_name_by_id[5] || "Stem", subtitle: "Part ID 5", part_ids: [5], other_row: false },
      { key: "veil", title: @part_name_by_id[6] || "Veil", subtitle: "Part ID 6", part_ids: [6], other_row: false },
      { key: "spores", title: @part_name_by_id[8] || "Spores", subtitle: "Part ID 8", part_ids: [8], other_row: false }
    ]

    rows.select! { |row| row[:part_ids].all? { |part_id| @part_name_by_id.key?(part_id) } }

    other_ids = @part_name_by_id
                  .keys
                  .reject { |part_id| PRIMARY_EDIT_PART_IDS.include?(part_id) || part_id == 1 }
                  .sort_by { |part_id| @part_name_by_id[part_id].to_s.downcase }

    rows << {
      key: "other_parts",
      title: "All Other Parts",
      subtitle: "Grouped by remaining part/method",
      part_ids: other_ids,
      other_row: true
    }

    rows
  end

  def build_matrix_entries_for_row(characters, row, active_tab)
    filtered = characters.select do |character|
      row[:part_ids].include?(character.part_id) && active_tab[:method_ids].include?(character.observation_method_id)
    end

    filtered.map do |character|
      {
        character: character,
        group_label: matrix_group_label(row, active_tab, character)
      }
    end.sort_by do |entry|
      [
        entry[:group_label].to_s.downcase,
        entry[:character].name.to_s.downcase
      ]
    end
  end

  def matrix_group_label(row, active_tab, character)
    return nil unless row[:other_row] || active_tab[:other_tab]

    part_name = @part_name_by_id[character.part_id] || "Unknown Part"
    method_name = @observation_method_name_by_id[character.observation_method_id] || "Unknown Method"

    if row[:other_row] && active_tab[:other_tab]
      "#{part_name} / #{method_name}"
    elsif row[:other_row]
      part_name
    else
      method_name
    end
  end

  def small_phone_user_agent?
    ua = request.user_agent.to_s.downcase
    return false if ua.blank?

    mobile = ua.match?(/iphone|ipod|android.*mobile|windows phone|blackberry|opera mini|mobile/)
    tablet = ua.match?(/ipad|tablet|kindle|silk|android(?!.*mobile)/)

    mobile && !tablet
  end
end
