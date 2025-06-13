class GillBreadthsController < ApplicationController
  before_action :set_gill_breadth, only: %i[ show edit update destroy ]

  # GET /gill_breadths or /gill_breadths.json
  def index
    @gill_breadths = GillBreadth.all
  end

  # GET /gill_breadths/1 or /gill_breadths/1.json
  def show
  end

  # GET /gill_breadths/new
  def new
    @gill_breadth = GillBreadth.new
  end

  # GET /gill_breadths/1/edit
  def edit
  end

  # POST /gill_breadths or /gill_breadths.json
  def create
    @gill_breadth = GillBreadth.new(gill_breadth_params)

    respond_to do |format|
      if @gill_breadth.save
        format.html { redirect_to @gill_breadth, notice: "Gill breadth was successfully created." }
        format.json { render :show, status: :created, location: @gill_breadth }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gill_breadth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gill_breadths/1 or /gill_breadths/1.json
  def update
    respond_to do |format|
      if @gill_breadth.update(gill_breadth_params)
        format.html { redirect_to @gill_breadth, notice: "Gill breadth was successfully updated." }
        format.json { render :show, status: :ok, location: @gill_breadth }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gill_breadth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gill_breadths/1 or /gill_breadths/1.json
  def destroy
    @gill_breadth.destroy!

    respond_to do |format|
      format.html { redirect_to gill_breadths_path, status: :see_other, notice: "Gill breadth was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gill_breadth
      @gill_breadth = GillBreadth.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gill_breadth_params
    params.require(gill_breadth: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
