class UniversalOuterVeilAppearancesController < ApplicationController
  before_action :set_universal_outer_veil_appearance, only: %i[ show edit update destroy ]

  # GET /universal_outer_veil_appearances or /universal_outer_veil_appearances.json
  def index
    @universal_outer_veil_appearances = UniversalOuterVeilAppearance.all
  end

  # GET /universal_outer_veil_appearances/1 or /universal_outer_veil_appearances/1.json
  def show
  end

  # GET /universal_outer_veil_appearances/new
  def new
    @universal_outer_veil_appearance = UniversalOuterVeilAppearance.new
  end

  # GET /universal_outer_veil_appearances/1/edit
  def edit
  end

  # POST /universal_outer_veil_appearances or /universal_outer_veil_appearances.json
  def create
    @universal_outer_veil_appearance = UniversalOuterVeilAppearance.new(universal_outer_veil_appearance_params)

    respond_to do |format|
      if @universal_outer_veil_appearance.save
        format.html { redirect_to @universal_outer_veil_appearance, notice: "Universal outer veil appearance was successfully created." }
        format.json { render :show, status: :created, location: @universal_outer_veil_appearance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @universal_outer_veil_appearance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universal_outer_veil_appearances/1 or /universal_outer_veil_appearances/1.json
  def update
    respond_to do |format|
      if @universal_outer_veil_appearance.update(universal_outer_veil_appearance_params)
        format.html { redirect_to @universal_outer_veil_appearance, notice: "Universal outer veil appearance was successfully updated." }
        format.json { render :show, status: :ok, location: @universal_outer_veil_appearance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @universal_outer_veil_appearance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universal_outer_veil_appearances/1 or /universal_outer_veil_appearances/1.json
  def destroy
    @universal_outer_veil_appearance.destroy!

    respond_to do |format|
      format.html { redirect_to universal_outer_veil_appearances_path, status: :see_other, notice: "Universal outer veil appearance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_universal_outer_veil_appearance
      @universal_outer_veil_appearance = UniversalOuterVeilAppearance.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def universal_outer_veil_appearance_params
      params.expect(universal_outer_veil_appearance: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
