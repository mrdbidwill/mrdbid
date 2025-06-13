class PartialInnerVeilAppearancesController < ApplicationController
  before_action :set_partial_inner_veil_appearance, only: %i[ show edit update destroy ]

  # GET /partial_inner_veil_appearances or /partial_inner_veil_appearances.json
  def index
    @partial_inner_veil_appearances = PartialInnerVeilAppearance.all
  end

  # GET /partial_inner_veil_appearances/1 or /partial_inner_veil_appearances/1.json
  def show
  end

  # GET /partial_inner_veil_appearances/new
  def new
    @partial_inner_veil_appearance = PartialInnerVeilAppearance.new
  end

  # GET /partial_inner_veil_appearances/1/edit
  def edit
  end

  # POST /partial_inner_veil_appearances or /partial_inner_veil_appearances.json
  def create
    @partial_inner_veil_appearance = PartialInnerVeilAppearance.new(partial_inner_veil_appearance_params)

    respond_to do |format|
      if @partial_inner_veil_appearance.save
        format.html { redirect_to @partial_inner_veil_appearance, notice: "Partial inner veil appearance was successfully created." }
        format.json { render :show, status: :created, location: @partial_inner_veil_appearance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @partial_inner_veil_appearance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partial_inner_veil_appearances/1 or /partial_inner_veil_appearances/1.json
  def update
    respond_to do |format|
      if @partial_inner_veil_appearance.update(partial_inner_veil_appearance_params)
        format.html { redirect_to @partial_inner_veil_appearance, notice: "Partial inner veil appearance was successfully updated." }
        format.json { render :show, status: :ok, location: @partial_inner_veil_appearance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partial_inner_veil_appearance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partial_inner_veil_appearances/1 or /partial_inner_veil_appearances/1.json
  def destroy
    @partial_inner_veil_appearance.destroy!

    respond_to do |format|
      format.html { redirect_to partial_inner_veil_appearances_path, status: :see_other, notice: "Partial inner veil appearance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partial_inner_veil_appearance
      @partial_inner_veil_appearance = PartialInnerVeilAppearance.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def partial_inner_veil_appearance_params
    params.require(partial_inner_veil_appearance: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
