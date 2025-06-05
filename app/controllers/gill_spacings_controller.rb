class GillSpacingsController < ApplicationController
  before_action :set_gill_spacing, only: %i[ show edit update destroy ]

  # GET /gill_spacings or /gill_spacings.json
  def index
    @gill_spacings = GillSpacing.all
  end

  # GET /gill_spacings/1 or /gill_spacings/1.json
  def show
  end

  # GET /gill_spacings/new
  def new
    @gill_spacing = GillSpacing.new
  end

  # GET /gill_spacings/1/edit
  def edit
  end

  # POST /gill_spacings or /gill_spacings.json
  def create
    @gill_spacing = GillSpacing.new(gill_spacing_params)

    respond_to do |format|
      if @gill_spacing.save
        format.html { redirect_to @gill_spacing, notice: "Gill spacing was successfully created." }
        format.json { render :show, status: :created, location: @gill_spacing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gill_spacing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gill_spacings/1 or /gill_spacings/1.json
  def update
    respond_to do |format|
      if @gill_spacing.update(gill_spacing_params)
        format.html { redirect_to @gill_spacing, notice: "Gill spacing was successfully updated." }
        format.json { render :show, status: :ok, location: @gill_spacing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gill_spacing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gill_spacings/1 or /gill_spacings/1.json
  def destroy
    @gill_spacing.destroy!

    respond_to do |format|
      format.html { redirect_to gill_spacings_path, status: :see_other, notice: "Gill spacing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gill_spacing
      @gill_spacing = GillSpacing.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gill_spacing_params
      params.expect(gill_spacing: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
