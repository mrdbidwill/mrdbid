class AnnulusPositionsController < ApplicationController
  before_action :set_annulus_position, only: %i[ show edit update destroy ]

  # GET /annulus_positions or /annulus_positions.json
  def index
    @annulus_positions = AnnulusPosition.all
  end

  # GET /annulus_positions/1 or /annulus_positions/1.json
  def show
  end

  # GET /annulus_positions/new
  def new
    @annulus_position = AnnulusPosition.new
  end

  # GET /annulus_positions/1/edit
  def edit
  end

  # POST /annulus_positions or /annulus_positions.json
  def create
    @annulus_position = AnnulusPosition.new(annulus_position_params)

    respond_to do |format|
      if @annulus_position.save
        format.html { redirect_to @annulus_position, notice: "Annulus position was successfully created." }
        format.json { render :show, status: :created, location: @annulus_position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @annulus_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annulus_positions/1 or /annulus_positions/1.json
  def update
    respond_to do |format|
      if @annulus_position.update(annulus_position_params)
        format.html { redirect_to @annulus_position, notice: "Annulus position was successfully updated." }
        format.json { render :show, status: :ok, location: @annulus_position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @annulus_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annulus_positions/1 or /annulus_positions/1.json
  def destroy
    @annulus_position.destroy!

    respond_to do |format|
      format.html { redirect_to annulus_positions_path, status: :see_other, notice: "Annulus position was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annulus_position
      @annulus_position = AnnulusPosition.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def annulus_position_params
      params.expect(annulus_position: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
