require "rails_helper"

RSpec.describe "dna_sequences/show", type: :view do
  before(:each) do
    assign(:dna_sequence, DnaSequence.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mushroom/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Genbank Number Url/)
    expect(rendered).to match(/Genbank Accession Number/)
    expect(rendered).to match(/Herbarium Catalog Number/)
    expect(rendered).to match(/Mycomap Blast Results/)
    expect(rendered).to match(/Provisional Species Name/)
    expect(rendered).to match(/Sequencing Technology/)
    expect(rendered).to match(/Trace Files Raw Dna Data/)
    expect(rendered).to match(/Voucher Number/)
  end
end
