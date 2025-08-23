# app/controllers/admin/fungus_types_controller.rb
class Admin::FungusTypesController < Admin::BaseController
include Pundit::Authorization

  # GET /fungus_types
def index
  authorize FungusType
  @fungus_types = policy_scope(FungusType.order(:name))
end

  # GET /fungus_types/1
  def show
    @fungus_type = authorize current_user.fungus_types.find(params[:id])
  end


  # GET /fungus_types/new
  def new
    @fungus_type = FungusType.new
    # Allow access to new action for signed-in users without ownership requirement
    authorize @fungus_type, :new?
  end

  # GET /fungus_types/1/edit
  def edit
    @fungus_type = authorize current_user.fungus_types.find(params[:id])
  end


  # POST /fungus_types
  def create
    @fungus_type = current_user.fungus_types.build(fungus_type_params)
    authorize @fungus_type
    if @fungus_type.save
      redirect_to fungus_type_url(@fungus_type), notice: "Fungus_Type was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fungus_types/1
  def update
    @fungus_type = authorize current_user.fungus_types.find(params[:id])
    if @fungus_type.update(fungus_type_params)
      redirect_to @fungus_type, notice: "Fungus_Type was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /projects/1
  def destroy
    @fungus_type = authorize current_user.projects.find(params[:id])
    @fungus_type.destroy!
    redirect_to admin_fungus_types_path, notice: "Fungus Type was successfully destroyed."
  end


  private
  # Only allow a list of trusted parameters through.
  def project_params
    params.expect(fungus_type: [ :name, :description, :comments ])
  end
end
