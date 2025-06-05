class StemInteriorsController < ApplicationController
  before_action :set_stem_interior, only: %i[ show edit update destroy ]

  # GET /stem_interiors or /stem_interiors.json
  def index
    @stem_interiors = StemInterior.all
  end

  # GET /stem_interiors/1 or /stem_interiors/1.json
  def show
  end

  # GET /stem_interiors/new
  def new
    @stem_interior = StemInterior.new
  end

  # GET /stem_interiors/1/edit
  def edit
  end

  # POST /stem_interiors or /stem_interiors.json
  def create
    @stem_interior = StemInterior.new(stem_interior_params)

    respond_to do |format|
      if @stem_interior.save
        format.html { redirect_to @stem_interior, notice: "Stem interior was successfully created." }
        format.json { render :show, status: :created, location: @stem_interior }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stem_interior.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stem_interiors/1 or /stem_interiors/1.json
  def update
    respond_to do |format|
      if @stem_interior.update(stem_interior_params)
        format.html { redirect_to @stem_interior, notice: "Stem interior was successfully updated." }
        format.json { render :show, status: :ok, location: @stem_interior }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stem_interior.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stem_interiors/1 or /stem_interiors/1.json
  def destroy
    @stem_interior.destroy!

    respond_to do |format|
      format.html { redirect_to stem_interiors_path, status: :see_other, notice: "Stem interior was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stem_interior
      @stem_interior = StemInterior.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stem_interior_params
      params.expect(stem_interior: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
