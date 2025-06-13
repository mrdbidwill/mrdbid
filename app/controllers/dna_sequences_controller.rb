class DnaSequencesController < ApplicationController
  before_action :set_dna_sequence, only: %i[ show edit update destroy ]

  # GET /dna_sequences or /dna_sequences.json
  def index
    @dna_sequences = DnaSequence.all
  end

  # GET /dna_sequences/1 or /dna_sequences/1.json
  def show
  end

  # GET /dna_sequences/new
  def new
    @dna_sequence = DnaSequence.new
  end

  # GET /dna_sequences/1/edit
  def edit
  end

  # POST /dna_sequences or /dna_sequences.json
  def create
    @dna_sequence = DnaSequence.new(dna_sequence_params)

    respond_to do |format|
      if @dna_sequence.save
        format.html { redirect_to @dna_sequence, notice: "Dna sequence was successfully created." }
        format.json { render :show, status: :created, location: @dna_sequence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dna_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dna_sequences/1 or /dna_sequences/1.json
  def update
    respond_to do |format|
      if @dna_sequence.update(dna_sequence_params)
        format.html { redirect_to @dna_sequence, notice: "Dna sequence was successfully updated." }
        format.json { render :show, status: :ok, location: @dna_sequence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dna_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dna_sequences/1 or /dna_sequences/1.json
  def destroy
    @dna_sequence.destroy!

    respond_to do |format|
      format.html { redirect_to dna_sequences_path, status: :see_other, notice: "Dna sequence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dna_sequence
      @dna_sequence = DnaSequence.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def dna_sequence_params
    params.require(dna_sequence: [ :mushroom_id_id, :notes, :dna_barcode_its, :genbank_number_url, :genbank_accession_number, :herbarium_catalog_number, :mycomap_blast_results, :provisional_species_name, :reads_in_consensus_ric, :sequencing_technology, :trace_files_raw_dna_data, :voucher_number, :entered_by_id ])
    end
end
