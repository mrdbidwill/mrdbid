class PartialInnerVeilFatesController < ApplicationController
  before_action :set_partial_inner_veil_fate, only: %i[ show edit update destroy ]

  # GET /partial_inner_veil_fates or /partial_inner_veil_fates.json
  def index
    @partial_inner_veil_fates = PartialInnerVeilFate.all
  end

  # GET /partial_inner_veil_fates/1 or /partial_inner_veil_fates/1.json
  def show
  end

  # GET /partial_inner_veil_fates/new
  def new
    @partial_inner_veil_fate = PartialInnerVeilFate.new
  end

  # GET /partial_inner_veil_fates/1/edit
  def edit
  end

  # POST /partial_inner_veil_fates or /partial_inner_veil_fates.json
  def create
    @partial_inner_veil_fate = PartialInnerVeilFate.new(partial_inner_veil_fate_params)

    respond_to do |format|
      if @partial_inner_veil_fate.save
        format.html { redirect_to @partial_inner_veil_fate, notice: "Partial inner veil fate was successfully created." }
        format.json { render :show, status: :created, location: @partial_inner_veil_fate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @partial_inner_veil_fate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partial_inner_veil_fates/1 or /partial_inner_veil_fates/1.json
  def update
    respond_to do |format|
      if @partial_inner_veil_fate.update(partial_inner_veil_fate_params)
        format.html { redirect_to @partial_inner_veil_fate, notice: "Partial inner veil fate was successfully updated." }
        format.json { render :show, status: :ok, location: @partial_inner_veil_fate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partial_inner_veil_fate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partial_inner_veil_fates/1 or /partial_inner_veil_fates/1.json
  def destroy
    @partial_inner_veil_fate.destroy!

    respond_to do |format|
      format.html { redirect_to partial_inner_veil_fates_path, status: :see_other, notice: "Partial inner veil fate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partial_inner_veil_fate
      @partial_inner_veil_fate = PartialInnerVeilFate.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def partial_inner_veil_fate_params
      params.expect(partial_inner_veil_fate: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
