# CamerasController controls camera access
class CamerasController < ApplicationController
  before_action :set_camera, only: %i[show edit update destroy]

  # GET /cameras or /cameras.json
  def index
    @cameras = Camera.all
  end

  # GET /cameras/1 or /cameras/1.json
  def show
    nil if @camera.nil?
  end

  # GET /cameras/new
  def new
    @camera = Camera.new
  end

  # GET /cameras/1/edit
  def edit
    nil if @camera.nil?
  end

  # POST /cameras or /cameras.json
  def create
    @camera = Camera.new(camera_params)

    respond_to_format do
      return render :new, status: :unprocessable_entity unless @camera.save

      render_response(@camera, :created, "Camera was successfully created.")
    end
  end

  # PATCH/PUT /cameras/1 or /cameras/1.json
  def update
    return if @camera.nil?

    respond_to_format do
      return render :edit, status: :unprocessable_entity unless @camera.update(camera_params)

      render_response(@camera, :ok, "Camera was successfully updated.")
    end
  end

  # DELETE /cameras/1 or /cameras.json
  def destroy
    return if @camera.nil?

    if @camera.destroy
      handle_destroy_success
    else
      handle_destroy_failure
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_camera
    @camera = Camera.find_by(id: params[:id])
    if @camera.nil?
      flash[:alert] = "Camera not found."
      redirect_to cameras_path and return
    end
  end



  # Only allow a list of trusted parameters through.
  def camera_params
    params.require(:camera).permit(:name, :description, :comments, :camera_make_id, :camera_model_id)
  end

  # Centralized responder for API and HTML formats
  def respond_to_format
    respond_to do |format|
      yield(format)
    end
  end

  # Helper for successful responses in create and update
  def render_response(camera, status, message)
    format.html { redirect_to camera, notice: message }
    format.json { render :show, status: status, location: camera }
  end

  # Successful destroy response
  def handle_destroy_success
    respond_to do |format|
      format.html { redirect_to cameras_path, status: :see_other, notice: "Camera successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Failed destroy response
  def handle_destroy_failure
    respond_to do |format|
      format.html { redirect_to cameras_path, status: :unprocessable_entity, alert: "Failed to destroy camera." }
      format.json { render json: { error: "Failed to destroy camera" }, status: :unprocessable_entity }
    end
  end
end
