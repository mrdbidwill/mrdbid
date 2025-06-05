class SpecimenAgesController < ApplicationController
  before_action :set_specimen_age, only: %i[ show edit update destroy ]

  # GET /specimen_ages or /specimen_ages.json
  def index
    @specimen_ages = SpecimenAge.all
  end

  # GET /specimen_ages/1 or /specimen_ages/1.json
  def show
  end

  # GET /specimen_ages/new
  def new
    @specimen_age = SpecimenAge.new
  end

  # GET /specimen_ages/1/edit
  def edit
  end

  # POST /specimen_ages or /specimen_ages.json
  def create
    @specimen_age = SpecimenAge.new(specimen_age_params)

    respond_to do |format|
      if @specimen_age.save
        format.html { redirect_to @specimen_age, notice: "Specimen age was successfully created." }
        format.json { render :show, status: :created, location: @specimen_age }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @specimen_age.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specimen_ages/1 or /specimen_ages/1.json
  def update
    respond_to do |format|
      if @specimen_age.update(specimen_age_params)
        format.html { redirect_to @specimen_age, notice: "Specimen age was successfully updated." }
        format.json { render :show, status: :ok, location: @specimen_age }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @specimen_age.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specimen_ages/1 or /specimen_ages/1.json
  def destroy
    @specimen_age.destroy!

    respond_to do |format|
      format.html { redirect_to specimen_ages_path, status: :see_other, notice: "Specimen age was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specimen_age
      @specimen_age = SpecimenAge.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def specimen_age_params
      params.expect(specimen_age: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
