class GenusController < ApplicationController
  include Pundit::Authorization

  # GET /genera or /genera.json
  def index
    @genera = policy_scope(Genus)
    respond_to do |format|
      format.html
      format.json { render json: @genera }
    end
  end

  # GET /genera/1 or /genera/1.json
  def show
    @genus = authorize current_user.genera.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @genera }
    end
  end


  # GET /genera/new
  def new
    @genus = Genus.new
    # Allow access to new action for signed-in users without ownership requirement
    authorize @genus, :new?
    respond_to do |format|
      format.html
      format.json { render json: @genera }
    end
  end

  # GET /genera/1/edit
  def edit
    @genus = authorize current_user.genera.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @genera }
    end
  end


  # POST /genera or /genera.json
  def create
    @genus = current_user.genera.build(genus_params)
    authorize @genus
    if @genus.save
      redirect_to genus_url(@genus), notice: "Genus was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genera/1 or /genera/1.json
  def update
    @genus = authorize current_user.genera.find(params[:id])
    if @genus.update(genus_params)
      redirect_to @genus, notice: "Genus was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /genera/1 or /genera/1.json
  def destroy
    @genus = authorize current_user.genera.find(params[:id])
    @genus.destroy!
    redirect_to genera_path, notice: "Genus was successfully destroyed."
  end


  private
  # Only allow a list of trusted parameters through.
  def genus_params
    params.expect(genus: [ :mblist_id, :taxon_name ])
  end
end
