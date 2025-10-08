class Admin::LookupTypesController < Admin::ApplicationController
  before_action :set_lookup_type, only: %i[ show edit update destroy ]

  # GET /lookup_types
  def index
    authorize LookupType
    @lookup_types = policy_scope(LookupType.order(:name))
  end

  # GET /lookup_types/1
  def show
    authorize @lookup_type
  end

  # GET /lookup_types/new
  def new
    @lookup_type = LookupType.new
    authorize @lookup_type
  end

  # POST /lookup_types
  def create
    @lookup_type = LookupType.new(lookup_type_params)
    authorize @lookup_type
    if @lookup_type.save
      redirect_to admin_lookup_type_path(@lookup_type), notice: "Lookup type was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /lookup_types/1/edit
  def edit
    authorize @lookup_type
  end

  # PATCH/PUT /lookup_types/1
  def update
    authorize @lookup_type
    if @lookup_type.update(lookup_type_params)
      redirect_to admin_lookup_type_path(@lookup_type), notice: "Lookup Type was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lookup_types/1
  def destroy
    authorize @lookup_type
    @lookup_type.destroy!
    redirect_to admin_lookup_types_path, notice: "Lookup type was successfully deleted."
  end

  private

  def set_lookup_type
    @lookup_type = LookupType.find(params.expect(:id))
  end

  def lookup_type_params
    params.expect(lookup_type: [:name, :description, :comments, :source])
  end
end