class UniversalOuterVeilFatesController < ApplicationController
  before_action :set_universal_outer_veil_fate, only: %i[ show edit update destroy ]

  # GET /universal_outer_veil_fates or /universal_outer_veil_fates.json
  def index
    @universal_outer_veil_fates = UniversalOuterVeilFate.all
  end

  # GET /universal_outer_veil_fates/1 or /universal_outer_veil_fates/1.json
  def show
  end

  # GET /universal_outer_veil_fates/new
  def new
    @universal_outer_veil_fate = UniversalOuterVeilFate.new
  end

  # GET /universal_outer_veil_fates/1/edit
  def edit
  end

  # POST /universal_outer_veil_fates or /universal_outer_veil_fates.json
  def create
    @universal_outer_veil_fate = UniversalOuterVeilFate.new(universal_outer_veil_fate_params)

    respond_to do |format|
      if @universal_outer_veil_fate.save
        format.html { redirect_to @universal_outer_veil_fate, notice: "Universal outer veil fate was successfully created." }
        format.json { render :show, status: :created, location: @universal_outer_veil_fate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @universal_outer_veil_fate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universal_outer_veil_fates/1 or /universal_outer_veil_fates/1.json
  def update
    respond_to do |format|
      if @universal_outer_veil_fate.update(universal_outer_veil_fate_params)
        format.html { redirect_to @universal_outer_veil_fate, notice: "Universal outer veil fate was successfully updated." }
        format.json { render :show, status: :ok, location: @universal_outer_veil_fate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @universal_outer_veil_fate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universal_outer_veil_fates/1 or /universal_outer_veil_fates/1.json
  def destroy
    @universal_outer_veil_fate.destroy!

    respond_to do |format|
      format.html { redirect_to universal_outer_veil_fates_path, status: :see_other, notice: "Universal outer veil fate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_universal_outer_veil_fate
      @universal_outer_veil_fate = UniversalOuterVeilFate.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def universal_outer_veil_fate_params
    params.require(universal_outer_veil_fate: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
