class GillEdgesController < ApplicationController
  before_action :set_gill_edge, only: %i[ show edit update destroy ]

  # GET /gill_edges or /gill_edges.json
  def index
    @gill_edges = GillEdge.all
  end

  # GET /gill_edges/1 or /gill_edges/1.json
  def show
  end

  # GET /gill_edges/new
  def new
    @gill_edge = GillEdge.new
  end

  # GET /gill_edges/1/edit
  def edit
  end

  # POST /gill_edges or /gill_edges.json
  def create
    @gill_edge = GillEdge.new(gill_edge_params)

    respond_to do |format|
      if @gill_edge.save
        format.html { redirect_to @gill_edge, notice: "Gill edge was successfully created." }
        format.json { render :show, status: :created, location: @gill_edge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gill_edge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gill_edges/1 or /gill_edges/1.json
  def update
    respond_to do |format|
      if @gill_edge.update(gill_edge_params)
        format.html { redirect_to @gill_edge, notice: "Gill edge was successfully updated." }
        format.json { render :show, status: :ok, location: @gill_edge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gill_edge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gill_edges/1 or /gill_edges/1.json
  def destroy
    @gill_edge.destroy!

    respond_to do |format|
      format.html { redirect_to gill_edges_path, status: :see_other, notice: "Gill edge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gill_edge
      @gill_edge = GillEdge.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gill_edge_params
    params.require(gill_edge: [ :name, :description ])
    end
end
