class Admin::PartsController < Admin::ApplicationController
  include Pundit::Authorization

  # GET /parts or /parts.json
  def index
    @parts = policy_scope(Part)
    respond_to do |format|

      format.html
      format.json { render json: @parts }
    end
  end

  # GET /parts/1 or /parts/1.json
  def show
    @part = authorize current_user.parts.find(params[:id])
    respond_to do |format|

      format.html
      format.json { render json: @parts }
    end
  end


  # GET /parts/new
  def new
    @part = Part.new
    # Allow access to new action for signed-in users without ownership requirement
    authorize @part, :new?
    respond_to do |format|

      format.html
      format.json { render json: @parts }
    end
  end

  # GET /parts/1/edit
  def edit
    @part = authorize current_user.parts.find(params[:id])
    respond_to do |format|

      format.html
      format.json { render json: @parts }
    end
  end


  # POST /parts or /parts.json
  def create
    @part = current_user.parts.build(part_params)
    authorize @part
    if @part.save
      redirect_to part_url(@part), notice: "Part was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parts/1 or /parts/1.json
  def update
    @part = authorize current_user.parts.find(params[:id])
    if @part.update(part_params)
      redirect_to @part, notice: "Part was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /parts/1 or /parts/1.json
  def destroy
    @part = authorize current_user.parts.find(params[:id])
    @part.destroy!
    redirect_to parts_path, notice: "Part was successfully destroyed."
  end


  private
  # Only allow a list of trusted parameters through.
  def part_params
    params.expect(part: [ :name, :description, :comments ])
  end
end
