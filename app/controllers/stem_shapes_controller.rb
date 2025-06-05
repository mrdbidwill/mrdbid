class StemShapesController < ApplicationController
  before_action :set_stem_shape, only: %i[ show edit update destroy ]

  # GET /stem_shapes or /stem_shapes.json
  def index
    @stem_shapes = StemShape.all
  end

  # GET /stem_shapes/1 or /stem_shapes/1.json
  def show
  end

  # GET /stem_shapes/new
  def new
    @stem_shape = StemShape.new
  end

  # GET /stem_shapes/1/edit
  def edit
  end

  # POST /stem_shapes or /stem_shapes.json
  def create
    @stem_shape = StemShape.new(stem_shape_params)

    respond_to do |format|
      if @stem_shape.save
        format.html { redirect_to @stem_shape, notice: "Stem shape was successfully created." }
        format.json { render :show, status: :created, location: @stem_shape }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stem_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stem_shapes/1 or /stem_shapes/1.json
  def update
    respond_to do |format|
      if @stem_shape.update(stem_shape_params)
        format.html { redirect_to @stem_shape, notice: "Stem shape was successfully updated." }
        format.json { render :show, status: :ok, location: @stem_shape }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stem_shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stem_shapes/1 or /stem_shapes/1.json
  def destroy
    @stem_shape.destroy!

    respond_to do |format|
      format.html { redirect_to stem_shapes_path, status: :see_other, notice: "Stem shape was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stem_shape
      @stem_shape = StemShape.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stem_shape_params
      params.expect(stem_shape: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
