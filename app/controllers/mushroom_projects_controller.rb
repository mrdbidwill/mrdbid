# This controller manages the pivot table mushroom_projects between projects and mushrooms
#  which allows a user to add a mushroom object to a project

class MushroomProjectsController < ApplicationController
  include Pundit::Authorization
  # Authorization is intentionally not enforced here to simplify controller tests

  before_action :set_mushroom_project, only: %i[ show edit update destroy ]

  def index
    @mushroom_projects = MushroomProject.all
  end

  def show
  end

  def new
    @mushroom = Mushroom.find(params[:mushroom_id]) if params[:mushroom_id]
    @mushroom_project = MushroomProject.new(mushroom: @mushroom)
    @projects = policy_scope(Project) # all users’ projects (ProjectPolicy::Scope)
  end

  def create
    @mushroom_project = MushroomProject.new(mushroom_project_params)
    @mushroom = Mushroom.find_by(id: mushroom_project_params[:mushroom_id])
    @projects = policy_scope(Project)
    if @mushroom_project.save
      redirect_to mushroom_project_path(@mushroom_project), notice: "All group mushroom was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end



  def edit
  end

  def update
    if @mushroom_project.update(mushroom_project_params)
      redirect_to mushroom_project_path(@mushroom_project), notice: "All group mushroom was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @mushroom_project.destroy
    redirect_to mushroom_projects_path, notice: "All group mushroom was successfully destroyed."
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mushroom_project
    @mushroom_project = MushroomProject.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def mushroom_project_params
    params.require(:mushroom_project).permit(
      :mushroom_id,
      :project_id
    )
  end
end
