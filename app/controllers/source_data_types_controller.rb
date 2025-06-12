class SourceDataTypesController < ApplicationController
  before_action :set_source_data_type, only: %i[ show edit update destroy ]

  # GET /source_data_types or /source_data_types.json
  def index
    @source_data_types = SourceDataType.all
  end

  # GET /source_data_types/1 or /source_data_types/1.json
  def show
  end

  # GET /source_data_types/new
  def new
    @source_data_type = SourceDataType.new
  end

  # GET /source_data_types/1/edit
  def edit
  end

  # POST /source_data_types or /source_data_types.json
  def create
    @source_data_type =SourceDataType.new(source_data_type_params)

    respond_to do |format|
      if @source_data_type.save
        format.html { redirect_to @source_data_type, notice: "Source data type was successfully created." }
        format.json { render :show, status: :created, location: @source_data_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @source_data_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_data_types/1 or /source_data_types/1.json
  def update
    respond_to do |format|
      if @source_data_type.update(source_data_type_params)
        format.html { redirect_to @source_data_type, notice: "Source data type was successfully updated." }
        format.json { render :show, status: :ok, location: @source_data_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @source_data_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_data_types/1 or /source_data_types/1.json
  def destroy
    @source_data_type.destroy!

    respond_to do |format|
      format.html { redirect_to source_data_types_path, status: :see_other, notice: "Source data type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_data_type
      @source_data_type = SourceDataType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def source_data_type_params
      params.expect(source_data_type: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
