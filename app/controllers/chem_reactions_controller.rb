class ChemReactionsController < ApplicationController
  before_action :set_chem_reaction, only: %i[ show edit update destroy ]

  # GET /chem_reactions or /chem_reactions.json
  def index
    @chem_reactions = ChemReaction.all
  end

  # GET /chem_reactions/1 or /chem_reactions/1.json
  def show
  end

  # GET /chem_reactions/new
  def new
    @chem_reaction = ChemReaction.new
  end

  # GET /chem_reactions/1/edit
  def edit
  end

  # POST /chem_reactions or /chem_reactions.json
  def create
    @chem_reaction = ChemReaction.new(chem_reaction_params)

    respond_to do |format|
      if @chem_reaction.save
        format.html { redirect_to @chem_reaction, notice: "Chem reaction was successfully created." }
        format.json { render :show, status: :created, location: @chem_reaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chem_reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chem_reactions/1 or /chem_reactions/1.json
  def update
    respond_to do |format|
      if @chem_reaction.update(chem_reaction_params)
        format.html { redirect_to @chem_reaction, notice: "Chem reaction was successfully updated." }
        format.json { render :show, status: :ok, location: @chem_reaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chem_reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chem_reactions/1 or /chem_reactions/1.json
  def destroy
    @chem_reaction.destroy!

    respond_to do |format|
      format.html { redirect_to chem_reactions_path, status: :see_other, notice: "Chem reaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chem_reaction
      @chem_reaction = ChemReaction.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def chem_reaction_params
    params.require(chem_reaction: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
