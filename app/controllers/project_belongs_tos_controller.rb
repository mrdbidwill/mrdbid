class ProjectBelongsTosController < ApplicationController
  before_action :set_project_belongs_to, only: %i[ show edit update destroy ]

  # GET /project_belongs_tos or /project_belongs_tos.json
  def index
    @project_belongs_tos = ProjectBelongsTo.all
  end

  # GET /project_belongs_tos/1 or /project_belongs_tos/1.json
  def show
  end

  # GET /project_belongs_tos/new
  def new
    @project_belongs_to = ProjectBelongsTo.new
  end

  # GET /project_belongs_tos/1/edit
  def edit
  end

  # POST /project_belongs_tos or /project_belongs_tos.json
  def create
    @project_belongs_to = ProjectBelongsTo.new(project_belongs_to_params)

    respond_to do |format|
      if @project_belongs_to.save
        format.html { redirect_to @project_belongs_to, notice: "Project belongs to was successfully created." }
        format.json { render :show, status: :created, location: @project_belongs_to }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_belongs_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_belongs_tos/1 or /project_belongs_tos/1.json
  def update
    respond_to do |format|
      if @project_belongs_to.update(project_belongs_to_params)
        format.html { redirect_to @project_belongs_to, notice: "Project belongs to was successfully updated." }
        format.json { render :show, status: :ok, location: @project_belongs_to }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_belongs_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_belongs_tos/1 or /project_belongs_tos/1.json
  def destroy
    @project_belongs_to.destroy!

    respond_to do |format|
      format.html { redirect_to project_belongs_tos_path, status: :see_other, notice: "Project belongs to was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_belongs_to
      @project_belongs_to = ProjectBelongsTo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def project_belongs_to_params
      params.expect(project_belongs_to: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
