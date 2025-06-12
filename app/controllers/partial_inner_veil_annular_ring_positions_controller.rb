class PartialInnerVeilAnnularRingPositionsController < ApplicationController
  before_action :set_partial_inner_veil_annular_ring_position, only: %i[ show edit update destroy ]

  # GET /partial_inner_veil_annular_ring_positions or /partial_inner_veil_annular_ring_positions.json
  def index
    @partial_inner_veil_annular_ring_positions = PartialInnerVeilAnnularRingPosition.all
  end

  # GET /partial_inner_veil_annular_ring_positions/1 or /partial_inner_veil_annular_ring_positions/1.json
  def show
  end

  # GET /partial_inner_veil_annular_ring_positions/new
  def new
    @partial_inner_veil_annular_ring_position = PartialInnerVeilAnnularRingPosition.new
  end

  # GET /partial_inner_veil_annular_ring_positions/1/edit
  def edit
  end

  # POST /partial_inner_veil_annular_ring_positions or /partial_inner_veil_annular_ring_positions.json
  def create
    @partial_inner_veil_annular_ring_position = PartialInnerVeilAnnularRingPosition.new(partial_inner_veil_annular_ring_position_params)

    respond_to do |format|
      if @partial_inner_veil_annular_ring_position.save
        format.html { redirect_to @partial_inner_veil_annular_ring_position, notice: "Partial inner veil annular ring position was successfully created." }
        format.json { render :show, status: :created, location: @partial_inner_veil_annular_ring_position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @partial_inner_veil_annular_ring_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partial_inner_veil_annular_ring_positions/1 or /partial_inner_veil_annular_ring_positions/1.json
  def update
    respond_to do |format|
      if @partial_inner_veil_annular_ring_position.update(partial_inner_veil_annular_ring_position_params)
        format.html { redirect_to @partial_inner_veil_annular_ring_position, notice: "Partial inner veil annular ring position was successfully updated." }
        format.json { render :show, status: :ok, location: @partial_inner_veil_annular_ring_position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partial_inner_veil_annular_ring_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partial_inner_veil_annular_ring_positions/1 or /partial_inner_veil_annular_ring_positions/1.json
  def destroy
    @partial_inner_veil_annular_ring_position.destroy!

    respond_to do |format|
      format.html { redirect_to partial_inner_veil_annular_ring_positions_path, status: :see_other, notice: "Partial inner veil annular ring position was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partial_inner_veil_annular_ring_position
      @partial_inner_veil_annular_ring_position = PartialInnerVeilAnnularRingPosition.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def partial_inner_veil_annular_ring_position_params
      params.expect(partial_inner_veil_annular_ring_position: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
