class SourcesController < ApplicationController
  before_action :set_data_source, only: %i[ show edit update destroy ]

  # GET /sources or /sources.json
  def index
    @sources = Source.all
  end

  # GET /sources/1 or /sources/1.json
  def show
  end

  # GET /sources/new
  def new
    @source = Source.new
  end

  # GET /sources/1/edit
  def edit
  end

  # POST /sources or /sources.json
  def create
    @source = Source.new(data_source_params)

    respond_to do |format|
      if @source.save
        format.html { redirect_to @source, notice: "Data source was successfully created." }
        format.json { render :show, status: :created, location: @source }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sources/1 or /sources/1.json
  def update
    respond_to do |format|
      if @source.update(data_source_params)
        format.html { redirect_to @source, notice: "Data source was successfully updated." }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1 or /sources/1.json
  def destroy
    @source.destroy!

    respond_to do |format|
      format.html { redirect_to data_sources_path, status: :see_other, notice: "Data source was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_source
      @source = Source.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def data_source_params
    params.require(source: [:title, :author, :ref, :item_code, :comment, :my_rating, :my_comment, :entered_by_id ])
    end
end
