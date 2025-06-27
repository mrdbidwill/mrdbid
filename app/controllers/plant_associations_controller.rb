class PlantAssociationsController < ApplicationController
  before_action :set_plant_association, only: %i[ show edit update destroy ]

  # GET /plant_associations or /plant_associations.json
  def index
    @plant_associations = PlantAssociation.all
  end

  # GET /plant_associations/1 or /plant_associations/1.json
  def show
  end

  # GET /plant_associations/new
  def new
    @plant_association = PlantAssociation.new
  end

  # GET /plant_associations/1/edit
  def edit
  end

  # POST /plant_associations or /plant_associations.json
  def create
    @plant_association = PlantAssociation.new(plant_association_params)

    respond_to do |format|
      if @plant_association.save
        format.html { redirect_to @plant_association, notice: "Plant association was successfully created." }
        format.json { render :show, status: :created, location: @plant_association }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plant_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plant_associations/1 or /plant_associations/1.json
  def update
    respond_to do |format|
      if @plant_association.update(plant_association_params)
        format.html { redirect_to @plant_association, notice: "Plant association was successfully updated." }
        format.json { render :show, status: :ok, location: @plant_association }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plant_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plant_associations/1 or /plant_associations/1.json
  def destroy
    @plant_association.destroy!

    respond_to do |format|
      format.html { redirect_to plant_associations_path, status: :see_other, notice: "Plant association was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant_association
      @plant_association = PlantAssociation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def plant_association_params
      params.expect(plant_association: [ :mushroom_id, :plant_id ])
    end
end
