require "rails_helper"

RSpec.describe "dna_sequences/edit", type: :view do
  let(:dna_sequence) {
    DnaSequence.create!(
      mushroom_id: "MyString",
      notes: "MyText",
      dna_barcode_its: "MyText",
      genbank_number_url: "MyString",
      genbank_accession_number: "MyString",
      herbarium_catalog_number: "MyString",
      mycomap_blast_results: "MyString",
      provisional_species_name: "MyString",
      sequencing_technology: "MyString",
      trace_files_raw_dna_data: "MyString",
      voucher_number: "MyString"
    )
  }

  before(:each) do
    assign(:dna_sequence, dna_sequence)
  end

  it "renders the edit dna_sequence form" do
    render

    assert_select "form[action=?][method=?]", dna_sequence_path(dna_sequence), "post" do
      assert_select "input[name=?]", "dna_sequence[mushroom_id]"

      assert_select "textarea[name=?]", "dna_sequence[notes]"

      assert_select "textarea[name=?]", "dna_sequence[dna_barcode_its]"

      assert_select "input[name=?]", "dna_sequence[genbank_number_url]"

      assert_select "input[name=?]", "dna_sequence[genbank_accession_number]"

      assert_select "input[name=?]", "dna_sequence[herbarium_catalog_number]"

      assert_select "input[name=?]", "dna_sequence[mycomap_blast_results]"

      assert_select "input[name=?]", "dna_sequence[provisional_species_name]"

      assert_select "input[name=?]", "dna_sequence[sequencing_technology]"

      assert_select "input[name=?]", "dna_sequence[trace_files_raw_dna_data]"

      assert_select "input[name=?]", "dna_sequence[voucher_number]"
    end
  end
end
