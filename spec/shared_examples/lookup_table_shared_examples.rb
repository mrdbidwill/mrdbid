# spec/shared_examples/lookup_table_shared_examples.rb
RSpec.shared_examples "a lookup table" do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:source) } # Assuming `source` is mandatory
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:comments) }

  describe "#display_name" do
    it "returns the name and description joined" do
      subject.name = "Test Name"
      subject.description = "Test Description"
      expect(subject.display_name).to eq("Test Name - Test Description")
    end
  end

  describe "#safe_name" do
    it "returns the name when present" do
      subject.name = "Test Name"
      expect(subject.safe_name).to eq("Test Name")
    end

    it "returns 'N/A' when the name is not present" do
      subject.name = nil
      expect(subject.safe_name).to eq("N/A")
    end
  end
end
