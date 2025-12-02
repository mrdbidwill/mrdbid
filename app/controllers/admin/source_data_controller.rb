class Admin::SourceDataController < Admin::ApplicationController
  before_action :set_source_data, only: %i[show edit update destroy]

  # GET /source_datas
  def index
    authorize SourceData
    @source_data = policy_scope(
      SourceData.includes(:source_data_type)
    )

    # Search by title or author (works with or without type filter)
    if params[:q].present?
      term_raw = params[:q].to_s.strip
      term = ActiveRecord::Base.sanitize_sql_like(term_raw)
      @source_data = @source_data.where(
        "title LIKE ? OR author LIKE ?",
        "%#{term}%", "%#{term}%"
      )
    end

    # Apply source_data_type filter if present
    @source_data = @source_data.where(source_data_type_id: params[:source_data_type_id]) if params[:source_data_type_id].present?

    # Smart sorting: ignore leading articles (A, An, The)
    # Sort by title with articles stripped, case-insensitive
    @source_data = @source_data.sort_by do |sd|
      title = sd.title.to_s
      # Remove leading "A ", "An ", "The " (case-insensitive)
      normalized = title.sub(/\A(a|an|the)\s+/i, '')
      normalized.downcase
    end

    # Populate source_data_types dropdown - only those that have source_data
    @source_data_types = SourceDataType
                          .where(id: SourceData.select(:source_data_type_id).distinct)
                          .order(:name)
                          .pluck(:name, :id)
  end


  # GET /source_datas/1
  def show
    authorize @source_data
  end

  # GET /source_datas/new
  def new
    @source_data = SourceData.new
    authorize @source_data
  end

  # POST /source_datas
  def create
    @source_data = SourceData.new(source_data_params)
    authorize @source_data
    if @source_data.save
      redirect_to admin_source_datum_path(@source_data), notice: "Source data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /source_datas/1/edit
  def edit
    authorize @source_data
  end

  # PATCH/PUT /source_datas/1
  def update
    authorize @source_data
    if @source_data.update(source_data_params)
      # Return to filtered view preserving both type and search
      redirect_to admin_source_data_path(
        source_data_type_id: params[:source_data_type_id],
        q: params[:q]
      ), notice: "Source data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /source_datas/1
  def destroy
    authorize @source_data
    @source_data.destroy!
    redirect_to admin_source_data_path, notice: "Source data was successfully deleted."
  end

  private

  def set_source_data
    @source_data = SourceData.includes(:source_data_type).order("title").find(params.expect(:id))
  end


  def source_data_params
    params.expect(source_data: [:title, :author, :ref, :item_code, :source_data_type_id, :comments])
  end
end
