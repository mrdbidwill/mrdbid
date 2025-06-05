class EpithetsController < ApplicationController
  before_action :set_epithet, only: %i[ show edit update destroy ]

  # GET /epithets or /epithets.json
  def index
    @epithets = Epithet.all
  end

  # GET /epithets/1 or /epithets/1.json
  def show
  end

  # GET /epithets/new
  def new
    @epithet = Epithet.new
  end

  # GET /epithets/1/edit
  def edit
  end

  # POST /epithets or /epithets.json
  def create
    @epithet = Epithet.new(epithet_params)

    respond_to do |format|
      if @epithet.save
        format.html { redirect_to @epithet, notice: "Epithet was successfully created." }
        format.json { render :show, status: :created, location: @epithet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @epithet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epithets/1 or /epithets/1.json
  def update
    respond_to do |format|
      if @epithet.update(epithet_params)
        format.html { redirect_to @epithet, notice: "Epithet was successfully updated." }
        format.json { render :show, status: :ok, location: @epithet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @epithet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epithets/1 or /epithets/1.json
  def destroy
    @epithet.destroy!

    respond_to do |format|
      format.html { redirect_to epithets_path, status: :see_other, notice: "Epithet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epithet
      @epithet = Epithet.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def epithet_params
      params.expect(epithet: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
