class Admin::CamerasController < Admin::ApplicationController
  before_action :set_camera, only: %i[show edit update destroy]

  # GET /cameras
  def index
    authorize Camera
    @cameras = policy_scope(Camera.order(:name))
  end

  # GET /cameras/1
  def show
    authorize @camera
  end

  # GET /cameras/new
  def new
    @camera = Camera.new
    authorize @camera
  end

  # POST /cameras
  def create
    @camera = Camera.new(camera_params)
    authorize @camera
    if @camera.save
      redirect_to admin_camera_path(@camera), notice: "Camera make was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /cameras/1/edit
  def edit
    authorize @camera
  end

  # PATCH/PUT /cameras/1
  def update
    authorize @camera
    if @camera.update(camera_params)
      redirect_to admin_camera_path(@camera), notice: "Camera make was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cameras/1
  def destroy
    authorize @camera
    @camera.destroy!
    redirect_to admin_cameras_path, notice: "Camera make was successfully destroyed."
  end

  private

  def set_camera
    @camera = Camera.find(params.expect(:id))
  end

  def camera_params
    params.expect(camera: [:name, :description, :comments, :source])
  end
end