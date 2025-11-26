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
  # - Users can only view/edit/delete their own mushrooms
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

  before_action :authenticate_user!, except: [:index] # Ensure user is authenticated first, except for index
  before_action :set_mushroom, only: %i[show edit update destroy edit_characters]
  before_action :authorize_mushroom, except: %i[index new create export_pdf]

  # GET /mushrooms
  def index
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
      @mushrooms = policy_scope(Mushroom)
                     .includes(:fungus_type, :country, :state, :genera, :species,
                               image_mushrooms: [:part, { image_file_attachment: :blob }])
                     .left_joins(:fungus_type)
                     .order(Arel.sql('fungus_types.name IS NULL'), 'fungus_types.name', 'mushrooms.name')
                     .page(params[:page])
                     .per(12)
    else
      # Show user_id 1's mushrooms to public visitors to demonstrate the site
      @mushrooms = Mushroom.where(user_id: 1)
                     .includes(:fungus_type, :country, :state, :genera, :species,
                               image_mushrooms: [:part, { image_file_attachment: :blob }])
                     .left_joins(:fungus_type)
                     .order(Arel.sql('fungus_types.name IS NULL'), 'fungus_types.name', 'mushrooms.name')
                     .page(params[:page])
                     .per(12)
    end
  end

  # GET /mushrooms/1 or /mushrooms/1.json
  def show
  end

  # GET /mushrooms/new
  def new
    @mushroom = Mushroom.new
    authorize @mushroom
  end

  # POST /mushrooms or /mushrooms.json
  def create
    @mushroom = current_user.mushrooms.build(mushroom_params.except(:user_id))
    authorize @mushroom # Authorize before saving

    if @mushroom.save
      redirect_to new_image_mushroom_path(mushroom_id: @mushroom.id), notice: "Mushroom was successfully created. Now add an image."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /mushrooms/1/edit
  def edit
    # set_mushroom before_action already loads the mushroom with basic associations
    # Reload with additional associations needed for edit view
    @mushroom = Mushroom
                  .includes(:genera, :species, :trees, :plants, :fungus_type,
                            image_mushrooms: [:part, { image_file_attachment: :blob }],
                            mr_character_mushrooms: { mr_character: [:part, :display_option, :source_data] })
                  .find(params[:id])
    authorize @mushroom
  rescue ActiveRecord::RecordNotFound
      redirect_to mushrooms_path, alert: "Mushroom not found."
  end

  # GET /mushrooms/1/edit_characters?observation_method_id=X&part_id=Y
  def edit_characters
    @observation_method = ObservationMethod.find(params[:observation_method_id])
    @part = Part.find(params[:part_id])

    # Get all characters for this observation_method + part combination
    # Filter by fungus_type if set (includes universal characters with fungus_type_id = NULL)
    if @mushroom.fungus_type_id.present?
      @characters = MrCharacter
                      .for_fungus_type(@mushroom.fungus_type_id)
                      .where(observation_method: @observation_method, part: @part)
                      .includes(:display_option, :source_data, :lookup_items)
                      .order(:name)
    else
      @characters = MrCharacter
                      .where(observation_method: @observation_method, part: @part)
                      .includes(:display_option, :source_data, :lookup_items)
                      .order(:name)
    end

    authorize @mushroom
  rescue ActiveRecord::RecordNotFound => e
    redirect_to edit_mushroom_path(@mushroom), alert: "#{e.message}"
  end


  # PATCH/PUT /mushrooms/1 or /mushrooms/1.json
  def update
    # ============================================================================
    # SECURITY: Prevent mass assignment of user_id
    # ============================================================================
    # Users should only be able to update their own mushrooms (enforced by Pundit policy).
    # This line ensures user_id cannot be changed via form tampering.
    filtered_params = mushroom_params.except(:user_id)

    if @mushroom.update(filtered_params)
      redirect_to @mushroom, notice: "Mushroom was successfully updated."
    else
      # ============================================================================
      # PERFORMANCE: Reload with eager loading to avoid N+1 queries in edit form
      # ============================================================================
      # When validation fails, we need to re-render the edit form. The form uses
      # associations (genera, mr_characters, etc.) that trigger strict_loading violations
      # if not preloaded. This single query fetches all required associations.
      #
      # ⚠️  WARNING: Do NOT add duplicate queries here (was causing performance issues)
      # This one comprehensive query replaces 4 duplicate queries that were here before.
      #
      # ASSOCIATIONS LOADED:
      # - genera: For genus selection dropdown
      # - mr_characters: Character traits assigned to this mushroom
      # - mr_characters.genera: Genus associations for each character
      # - mr_characters.part, observation_method, color, source_data: Character metadata
      # ============================================================================
      @mushroom = Mushroom.includes(:genera, mr_characters: [:genera, :part, :observation_method, :color, :source_data]).find(@mushroom.id)
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mushrooms/1 or /mushrooms/1.json
  def destroy
    # Temporarily disable strict_loading for this mushroom
    @mushroom.strict_loading!(false) if @mushroom.respond_to?(:strict_loading!)
    @mushroom.destroy
    redirect_to mushrooms_path, notice: "Mushroom was successfully deleted."
  end

  # GET /mushrooms/export.pdf or /mushrooms/:id/export.pdf
  def export_pdf
    # Determine which mushrooms to export
    if params[:id].present?
      # Single mushroom export
      mushroom = Mushroom
                   .includes(:country, :state, :fungus_type, :genera, :species, :trees, :plants,
                             image_mushrooms: { image_file_attachment: :blob },
                             mr_character_mushrooms: { mr_character: [:part, :display_option] })
                   .find(params[:id])
      authorize mushroom
      mushrooms = [mushroom]
      filename = "#{mushroom.name.parameterize}-#{Date.today}.pdf"
    elsif params[:ids].present?
      # Multiple specific mushrooms
      mushrooms = policy_scope(Mushroom)
                    .includes(:country, :state, :fungus_type, :genera, :species, :trees, :plants,
                              image_mushrooms: { image_file_attachment: :blob },
                              mr_character_mushrooms: { mr_character: [:part, :display_option] })
                    .where(id: params[:ids])
                    .order(:name)
      filename = "mushrooms-export-#{Date.today}.pdf"
    else
      # All user's mushrooms
      mushrooms = policy_scope(Mushroom)
                    .includes(:country, :state, :fungus_type, :genera, :species, :trees, :plants,
                              image_mushrooms: { image_file_attachment: :blob },
                              mr_character_mushrooms: { mr_character: [:part, :display_option] })
                    .order(:name)
      filename = "all-mushrooms-#{Date.today}.pdf"
    end

    # Generate PDF
    pdf = MushroomPdfService.new(mushrooms).generate

    # Send PDF
    send_data pdf.render,
              filename: filename,
              type: 'application/pdf',
              disposition: 'attachment'
  rescue ActiveRecord::RecordNotFound
    redirect_to mushrooms_path, alert: 'Mushroom not found.'
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
                  .includes(:country, :state, :fungus_type, :genera, :species, :trees, :plants, image_mushrooms: { image_file_attachment: :blob })
                  .find(params[:id])
    authorize @mushroom
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
    params.require(:mushroom).permit(:name, :description, :comments, :user_id, :country_id, :state_id, :fungus_type_id, :collection_date)
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
    authorize @mushroom if respond_to?(:authorize)
  end
end
