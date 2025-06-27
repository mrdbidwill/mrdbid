require "rails_helper"

RSpec.describe "dna_sequences/index", type: :view do
  before(:each) do
    assign(:dna_sequences, [
      DnaSequence.create!(
        mushroom_id: "Mushroom",
        notes: "MyText",
        dna_barcode_its: "MyText",
        genbank_number_url: "Genbank Number Url",
        genbank_accession_number: "Genbank Accession Number",
        herbarium_catalog_number: "Herbarium Catalog Number",
        mycomap_blast_results: "Mycomap Blast Results",
        provisional_species_name: "Provisional Species Name",
        sequencing_technology: "Sequencing Technology",
        trace_files_raw_dna_data: "Trace Files Raw Dna Data",
        voucher_number: "Voucher Number"
      ),
      DnaSequence.create!(
        mushroom_id: "Mushroom",
        notes: "MyText",
        dna_barcode_its: "MyText",
        genbank_number_url: "Genbank Number Url",
        genbank_accession_number: "Genbank Accession Number",
        herbarium_catalog_number: "Herbarium Catalog Number",
        mycomap_blast_results: "Mycomap Blast Results",
        provisional_species_name: "Provisional Species Name",
        sequencing_technology: "Sequencing Technology",
        trace_files_raw_dna_data: "Trace Files Raw Dna Data",
        voucher_number: "Voucher Number"
      )
    ])
  end

  it "renders a list of dna_sequences" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Mushroom"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("Genbank Number Url"), count: 2
    assert_select cell_selector, text: Regexp.new("Genbank Accession Number"), count: 2
    assert_select cell_selector, text: Regexp.new("Herbarium Catalog Number"), count: 2
    assert_select cell_selector, text: Regexp.new("Mycomap Blast Results"), count: 2
    assert_select cell_selector, text: Regexp.new("Provisional Species Name"), count: 2
    assert_select cell_selector, text: Regexp.new("Sequencing Technology"), count: 2
    assert_select cell_selector, text: Regexp.new("Trace Files Raw Dna Data"), count: 2
    assert_select cell_selector, text: Regexp.new("Voucher Number"), count: 2
  end
end
