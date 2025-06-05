class BulbTypesController < ApplicationController
  before_action :set_bulb_type, only: %i[ show edit update destroy ]

  # GET /bulb_types or /bulb_types.json
  def index
    @bulb_types = BulbType.all
  end

  # GET /bulb_types/1 or /bulb_types/1.json
  def show
  end

  # GET /bulb_types/new
  def new
    @bulb_type = BulbType.new
  end

  # GET /bulb_types/1/edit
  def edit
  end

  # POST /bulb_types or /bulb_types.json
  def create
    @bulb_type = BulbType.new(bulb_type_params)

    respond_to do |format|
      if @bulb_type.save
        format.html { redirect_to @bulb_type, notice: "Bulb type was successfully created." }
        format.json { render :show, status: :created, location: @bulb_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bulb_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bulb_types/1 or /bulb_types/1.json
  def update
    respond_to do |format|
      if @bulb_type.update(bulb_type_params)
        format.html { redirect_to @bulb_type, notice: "Bulb type was successfully updated." }
        format.json { render :show, status: :ok, location: @bulb_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bulb_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulb_types/1 or /bulb_types/1.json
  def destroy
    @bulb_type.destroy!

    respond_to do |format|
      format.html { redirect_to bulb_types_path, status: :see_other, notice: "Bulb type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulb_type
      @bulb_type = BulbType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def bulb_type_params
      params.expect(bulb_type: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
