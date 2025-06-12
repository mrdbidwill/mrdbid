class ToxicsController < ApplicationController
  before_action :set_toxic, only: %i[ show edit update destroy ]

  # GET /toxics or /toxics.json
  def index
    @toxics = Toxic.all
  end

  # GET /toxics/1 or /toxics/1.json
  def show
  end

  # GET /toxics/new
  def new
    @toxic = Toxic.new
  end

  # GET /toxics/1/edit
  def edit
  end

  # POST /toxics or /toxics.json
  def create
    @toxic = Toxic.new(toxic_params)

    respond_to do |format|
      if @toxic.save
        format.html { redirect_to @toxic, notice: "Toxic was successfully created." }
        format.json { render :show, status: :created, location: @toxic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @toxic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toxics/1 or /toxics/1.json
  def update
    respond_to do |format|
      if @toxic.update(toxic_params)
        format.html { redirect_to @toxic, notice: "Toxic was successfully updated." }
        format.json { render :show, status: :ok, location: @toxic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @toxic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toxics/1 or /toxics/1.json
  def destroy
    @toxic.destroy!

    respond_to do |format|
      format.html { redirect_to toxics_path, status: :see_other, notice: "Toxic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toxic
      @toxic = Toxic.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def toxic_params
      params.expect(toxic: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
