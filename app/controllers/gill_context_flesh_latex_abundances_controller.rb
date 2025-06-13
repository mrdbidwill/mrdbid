class GillContextFleshLatexAbundancesController < ApplicationController
  before_action :set_gill_context_flesh_latex_abundance, only: %i[ show edit update destroy ]

  # GET /gill_context_flesh_latex_abundances or /gill_context_flesh_latex_abundances.json
  def index
    @gill_context_flesh_latex_abundances = GillContextFleshLatexAbundance.all
  end

  # GET /gill_context_flesh_latex_abundances/1 or /gill_context_flesh_latex_abundances/1.json
  def show
  end

  # GET /gill_context_flesh_latex_abundances/new
  def new
    @gill_context_flesh_latex_abundance = GillContextFleshLatexAbundance.new
  end

  # GET /gill_context_flesh_latex_abundances/1/edit
  def edit
  end

  # POST /gill_context_flesh_latex_abundances or /gill_context_flesh_latex_abundances.json
  def create
    @gill_context_flesh_latex_abundance = GillContextFleshLatexAbundance.new(gill_context_flesh_latex_abundance_params)

    respond_to do |format|
      if @gill_context_flesh_latex_abundance.save
        format.html { redirect_to @gill_context_flesh_latex_abundance, notice: "Gill context flesh latex abundance was successfully created." }
        format.json { render :show, status: :created, location: @gill_context_flesh_latex_abundance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gill_context_flesh_latex_abundance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gill_context_flesh_latex_abundances/1 or /gill_context_flesh_latex_abundances/1.json
  def update
    respond_to do |format|
      if @gill_context_flesh_latex_abundance.update(gill_context_flesh_latex_abundance_params)
        format.html { redirect_to @gill_context_flesh_latex_abundance, notice: "Gill context flesh latex abundance was successfully updated." }
        format.json { render :show, status: :ok, location: @gill_context_flesh_latex_abundance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gill_context_flesh_latex_abundance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gill_context_flesh_latex_abundances/1 or /gill_context_flesh_latex_abundances/1.json
  def destroy
    @gill_context_flesh_latex_abundance.destroy!

    respond_to do |format|
      format.html { redirect_to gill_context_flesh_latex_abundances_path, status: :see_other, notice: "Gill context flesh latex abundance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gill_context_flesh_latex_abundance
      @gill_context_flesh_latex_abundance = GillContextFleshLatexAbundance.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gill_context_flesh_latex_abundance_params
    params.require(gill_context_flesh_latex_abundance: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
