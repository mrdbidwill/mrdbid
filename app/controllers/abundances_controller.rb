class AbundancesController < ApplicationController
  before_action :set_abundance, only: %i[ show edit update destroy ]

  # GET /abundances or /abundances.json
  def index
    @abundances = Abundance.all
  end

  # GET /abundances/1 or /abundances/1.json
  def show
  end

  # GET /abundances/new
  def new
    @abundance = Abundance.new
  end

  # GET /abundances/1/edit
  def edit
  end

  # POST /abundances or /abundances.json
  def create
    @abundance = Abundance.new(abundance_params)

    respond_to do |format|
      if @abundance.save
        format.html { redirect_to @abundance, notice: "Abundance was successfully created." }
        format.json { render :show, status: :created, location: @abundance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @abundance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abundances/1 or /abundances/1.json
  def update
    respond_to do |format|
      if @abundance.update(abundance_params)
        format.html { redirect_to @abundance, notice: "Abundance was successfully updated." }
        format.json { render :show, status: :ok, location: @abundance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @abundance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abundances/1 or /abundances/1.json
  def destroy
    @abundance.destroy!

    respond_to do |format|
      format.html { redirect_to abundances_path, status: :see_other, notice: "Abundance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abundance
      @abundance = Abundance.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def abundance_params
      params.expect(abundance: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
