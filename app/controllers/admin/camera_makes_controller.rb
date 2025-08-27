class Admin::CameraMakesController < Admin::ApplicationController
  before_action :set_camera_make, only: %i[show edit update destroy]

  # GET /camera_makes
  def index
    authorize CameraMake
    @camera_makes = policy_scope(CameraMake.order(:name))
  end

  # GET /camera_makes/1
  def show
    authorize @camera_make
  end

  # GET /camera_makes/new
  def new
    @camera_make = CameraMake.new
    authorize @camera_make
  end

  # POST /camera_makes
  def create
    @camera_make = CameraMake.new(camera_make_params)
    authorize @camera_make
    if @camera_make.save
      redirect_to admin_camera_make_path(@camera_make), notice: "Camera make was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /camera_makes/1/edit
  def edit
    authorize @camera_make
  end

  # PATCH/PUT /camera_makes/1
  def update
    authorize @camera_make
    if @camera_make.update(camera_make_params)
      redirect_to admin_camera_make_path(@camera_make), notice: "Camera make was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /camera_makes/1
  def destroy
    authorize @camera_make
    @camera_make.destroy!
    redirect_to admin_camera_makes_path, notice: "Camera make was successfully destroyed."
  end

  private

  def set_camera_make
    @camera_make = CameraMake.find(params.expect(:id))
  end

  def camera_make_params
    params.expect(camera_make: [:name, :description, :comments, :source])
  end
end
