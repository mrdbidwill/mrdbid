class Admin::DnaSequencesController < Admin::ApplicationController
  before_action :set_camera_make, only: %i[show edit update destroy]

  # GET /dna_sequences
  def index
    authorize DnaSequence
    @dna_sequences = policy_scope(DnaSequence.order(:name))
  end

  # GET /dna_sequences/1
  def show
    authorize @camera_make
  end

  # GET /dna_sequences/new
  def new
    @camera_make = DnaSequence.new
    authorize @camera_make
  end

  # POST /dna_sequences
  def create
    @camera_make = DnaSequence.new(camera_make_params)
    authorize @camera_make
    if @camera_make.save
      redirect_to admin_camera_make_path(@camera_make), notice: "Camera make was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /dna_sequences/1/edit
  def edit
    authorize @camera_make
  end

  # PATCH/PUT /dna_sequences/1
  def update
    authorize @camera_make
    if @camera_make.update(camera_make_params)
      redirect_to admin_camera_make_path(@camera_make), notice: "Camera make was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /dna_sequences/1
  def destroy
    authorize @camera_make
    @camera_make.destroy!
    redirect_to admin_dna_sequences_path, notice: "Camera make was successfully destroyed."
  end

  private

  def set_camera_make
    @camera_make = DnaSequence.find(params.expect(:id))
  end

  def camera_make_params
    params.expect(camera_make: [:name, :description, :comments, :source])
  end
end