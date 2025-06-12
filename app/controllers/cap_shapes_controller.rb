class CapShapesController < ApplicationController
  before_action :set_cap_shape, only: %i[ show edit update destroy ]

  # GET /cap_shapes or /cap_shapes.json
  def index
    @cap_shapes = CapShape.all
  end

  # GET /cap_shapes/1 or /cap_shapes/1.json
  def show
  end

  # GET /cap_shapes/new
  def new
    @cap_shape = CapShape.new
  end

  # GET /cap_shapes/1/edit
  def edit
  end

  # POST /cap_shapes or /cap_shapes.json
  def create
    @cap_shape = CapShape.new(cap_shape_params)

    respond_to do |format|
      if @cap_shape.save
        format.html { redirect_to @cap_shape, notice: "Cap shape was successfully created." }
        format.json { render :show, status: :created, location: @cap_shape }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cap_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cap_shapes/1 or /cap_shapes/1.json
  def update
    respond_to do |format|
      if @cap_shape.update(cap_shape_params)
        format.html { redirect_to @cap_shape, notice: "Cap shape was successfully updated." }
        format.json { render :show, status: :ok, location: @cap_shape }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cap_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cap_shapes/1 or /cap_shapes/1.json
  def destroy
    @cap_shape.destroy!

    respond_to do |format|
      format.html { redirect_to cap_shapes_path, status: :see_other, notice: "Cap shape was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cap_shape
      @cap_shape = CapShape.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cap_shape_params
      params.expect(cap_shape: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
