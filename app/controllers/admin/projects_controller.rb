# Admin controller for managing universal projects
# Universal projects have user_id = nil and are available to all users
class Admin::ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /admin/projects
  def index
    @projects = Project.order(:name)
  end

  # GET /admin/projects/1
  def show
  end

  # GET /admin/projects/new
  def new
    @project = Project.new
  end

  # GET /admin/projects/1/edit
  def edit
  end

  # POST /admin/projects
  def create
    @project = Project.new(project_params)
    @project.user_id = nil  # Force universal project

    if @project.save
      redirect_to admin_projects_path, notice: "Universal project '#{@project.name}' was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/projects/1
  def update
    if @project.update(project_params)
      redirect_to admin_projects_path, notice: "Project '#{@project.name}' was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/projects/1
  def destroy
    name = @project.name
    @project.destroy!
    redirect_to admin_projects_path, notice: "Project '#{name}' was successfully deleted."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :comments)
  end

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "Access denied. Admin privileges required."
    end
  end
end
