class Admin::GeneraController < Admin::BaseController
  include Pundit::Authorization

  # GET /admin/genera
  def index
    @genera = policy_scope(Genus)
    respond_to do |format|
      format.html
      format.json { render json: @genera }
    end
  end

  # GET /admin/genera/:id
  def show
    @genus = authorize Genus.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @genus }
    end
  end

  # GET /admin/genera/new
  def new
    @genus = Genus.new
    authorize @genus
  end

  # POST /admin/genera
  def create
    @genus = Genus.new(genus_params)
    authorize @genus

    if @genus.save
      redirect_to admin_genera_path(@genus), notice: "Genus was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /admin/genera/:id/edit
  def edit
    @genus = authorize Genus.find(params[:id])
  end

  # PATCH/PUT /admin/genera/:id
  def update
    @genus = authorize Genus.find(params[:id])

    if @genus.update(genus_params)
      redirect_to admin_genera_path(@genus), notice: "Genus was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/genera/:id
  def destroy
    @genus = authorize Genus.find(params[:id])
    @genus.destroy!
    redirect_to admin_genera_index_path, notice: "Genus was successfully destroyed."
  end

  private

  # Strong parameters
  def genus_params
    params.require(:genus).permit(:mblist_id, :taxon_name)
  end
end