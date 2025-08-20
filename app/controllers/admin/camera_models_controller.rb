class Admin::CameraModelsController < Admin::ApplicationController
  before_action :set_camera_model, only: %i[show edit update destroy]

  # GET /camera_models
  def index
    @camera_models = CameraModel.order(:name)
  end

  # GET /camera_models/1
  def show
    # @camera_model set by before_action
  end

  # GET /camera_models/new
  def new
    @camera_model = CameraModel.new
  end

  # POST /camera_models
  def create
    @camera_model = CameraModel.new(camera_model_params)
    if @camera_model.save
      redirect_to admin_camera_model_path(@camera_model), notice: "Camera model was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /camera_models/1/edit
  def edit
    # @camera_model set by before_action
  end

  # PATCH/PUT /camera_models/1
  def update
    if @camera_model.update(camera_model_params)
      redirect_to admin_camera_model_path(@camera_model), notice: "Camera model was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /camera_models/1
  def destroy
    @camera_model.destroy!
    redirect_to admin_camera_models_path, notice: "Camera model was successfully destroyed."
  end

  private

  def set_camera_model
    @camera_model = CameraModel.find(params.expect(:id))
  end

  def camera_model_params
    params.expect(camera_model: [:name, :description, :comments, :source])
  end
end