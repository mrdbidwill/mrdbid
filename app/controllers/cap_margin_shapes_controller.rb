class CapMarginShapesController < ApplicationController
  before_action :set_cap_margin_shape, only: %i[ show edit update destroy ]

  # GET /cap_margin_shapes or /cap_margin_shapes.json
  def index
    @cap_margin_shapes = CapMarginShape.all
  end

  # GET /cap_margin_shapes/1 or /cap_margin_shapes/1.json
  def show
  end

  # GET /cap_margin_shapes/new
  def new
    @cap_margin_shape = CapMarginShape.new
  end

  # GET /cap_margin_shapes/1/edit
  def edit
  end

  # POST /cap_margin_shapes or /cap_margin_shapes.json
  def create
    @cap_margin_shape = CapMarginShape.new(cap_margin_shape_params)

    respond_to do |format|
      if @cap_margin_shape.save
        format.html { redirect_to @cap_margin_shape, notice: "Cap margin shape was successfully created." }
        format.json { render :show, status: :created, location: @cap_margin_shape }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cap_margin_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cap_margin_shapes/1 or /cap_margin_shapes/1.json
  def update
    respond_to do |format|
      if @cap_margin_shape.update(cap_margin_shape_params)
        format.html { redirect_to @cap_margin_shape, notice: "Cap margin shape was successfully updated." }
        format.json { render :show, status: :ok, location: @cap_margin_shape }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cap_margin_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cap_margin_shapes/1 or /cap_margin_shapes/1.json
  def destroy
    @cap_margin_shape.destroy!

    respond_to do |format|
      format.html { redirect_to cap_margin_shapes_path, status: :see_other, notice: "Cap margin shape was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cap_margin_shape
      @cap_margin_shape = CapMarginShape.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cap_margin_shape_params
      params.expect(cap_margin_shape: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
