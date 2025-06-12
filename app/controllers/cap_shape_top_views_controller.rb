class CapShapeTopViewsController < ApplicationController
  before_action :set_cap_shape_top_view, only: %i[ show edit update destroy ]

  # GET /cap_shape_top_views or /cap_shape_top_views.json
  def index
    @cap_shape_top_views = CapShapeTopView.all
  end

  # GET /cap_shape_top_views/1 or /cap_shape_top_views/1.json
  def show
  end

  # GET /cap_shape_top_views/new
  def new
    @cap_shape_top_view = CapShapeTopView.new
  end

  # GET /cap_shape_top_views/1/edit
  def edit
  end

  # POST /cap_shape_top_views or /cap_shape_top_views.json
  def create
    @cap_shape_top_view = CapShapeTopView.new(cap_shape_top_view_params)

    respond_to do |format|
      if @cap_shape_top_view.save
        format.html { redirect_to @cap_shape_top_view, notice: "Cap shape top view was successfully created." }
        format.json { render :show, status: :created, location: @cap_shape_top_view }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cap_shape_top_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cap_shape_top_views/1 or /cap_shape_top_views/1.json
  def update
    respond_to do |format|
      if @cap_shape_top_view.update(cap_shape_top_view_params)
        format.html { redirect_to @cap_shape_top_view, notice: "Cap shape top view was successfully updated." }
        format.json { render :show, status: :ok, location: @cap_shape_top_view }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cap_shape_top_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cap_shape_top_views/1 or /cap_shape_top_views/1.json
  def destroy
    @cap_shape_top_view.destroy!

    respond_to do |format|
      format.html { redirect_to cap_shape_top_views_path, status: :see_other, notice: "Cap shape top view was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cap_shape_top_view
      @cap_shape_top_view = CapShapeTopView.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cap_shape_top_view_params
      params.expect(cap_shape_top_view: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
