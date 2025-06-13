class PossibleMatchesController < ApplicationController
  before_action :set_possible_match, only: %i[ show edit update destroy ]

  # GET /possible_matches or /possible_matches.json
  def index
    @possible_matches = PossibleMatch.all
  end

  # GET /possible_matches/1 or /possible_matches/1.json
  def show
  end

  # GET /possible_matches/new
  def new
    @possible_match = PossibleMatch.new
  end

  # GET /possible_matches/1/edit
  def edit
  end

  # POST /possible_matches or /possible_matches.json
  def create
    @possible_match = PossibleMatch.new(possible_match_params)

    respond_to do |format|
      if @possible_match.save
        format.html { redirect_to @possible_match, notice: "Possible match was successfully created." }
        format.json { render :show, status: :created, location: @possible_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @possible_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /possible_matches/1 or /possible_matches/1.json
  def update
    respond_to do |format|
      if @possible_match.update(possible_match_params)
        format.html { redirect_to @possible_match, notice: "Possible match was successfully updated." }
        format.json { render :show, status: :ok, location: @possible_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @possible_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /possible_matches/1 or /possible_matches/1.json
  def destroy
    @possible_match.destroy!

    respond_to do |format|
      format.html { redirect_to possible_matches_path, status: :see_other, notice: "Possible match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_possible_match
      @possible_match = PossibleMatch.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def possible_match_params
    params.require(possible_match: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
