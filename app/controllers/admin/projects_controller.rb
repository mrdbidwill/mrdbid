# app/controllers/admin/projects_controller.rb
class Admin::ProjectsController < Admin::ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  # GET /projects or /projects.json
  def index
    authorize Project
    @projects = policy_scope(Project)
  end

  # GET /projects/1 or /projects/1.json
  def show
    authorize @project
    @project = authorize current_user.projects.find(params[:id])
  end


  # GET /projects/new
  def new
    authorize Project
    @project = Project.new
    # Allow access to new action for signed-in users without ownership requirement
    authorize @project, :new?
  end

  # GET /projects/1/edit
  def edit
    authorize @project
    @project = authorize current_user.projects.find(params[:id])
  end


  # POST /projects
  def create
    @project = current_user.projects.build(project_params)
    authorize @project
    if @project.save
      redirect_to project_url(@project), notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    authorize @project
    @project = authorize current_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /projects/1
  def destroy
    authorize @project
    @project = authorize current_user.projects.find(params[:id])
    @project.destroy!
    redirect_to admin_projects_path, notice: "Project was successfully destroyed."
  end


  private

  def set_project
    @project = Project.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.expect(project: [ :name, :description, :comments ])
  end
end
