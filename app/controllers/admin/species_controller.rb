class     SpeciesController < ApplicationController
  include Pundit::Authorization

  # GET /species or /species.json
  def index
    @species = policy_scope(Project)
  end

  # GET /species/1 or /species/1.json
  def show
    @species = authorize current_user.species.find(params[:id])
  end


  # GET /species/new
  def new
    @species = Species.new
    # Allow access to new action for signed-in users without ownership requirement
    authorize @species, :new?
  end

  # GET /    species/1/edit
  def edit
    @species = authorize current_user.species.find(params[:id])
  end


  # POST /species or /species.json
  def create
    @species = current_user.species.build(species_params)
    authorize @species
    if @species.save
      redirect_to species_url(@species), notice: "Species was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /species/1 or /species/1.json
  def update
    @species = authorize current_user.species.find(params[:id])
    if @species.update(species_params)
      redirect_to @species, notice: "Species was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /species/1 or /species/1.json
  def destroy
    @species = authorize current_user.species.find(params[:id])
    @species.destroy!
    redirect_to species_path, notice: "Species was successfully destroyed."
  end


  private
  # Only allow a list of trusted parameters through.
  def     species_params
    params.expect(species: [ :mblist_id, :taxon_name, :genera_id ])
  end
end
