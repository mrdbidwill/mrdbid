# spec/shared_examples/lookup_table_shared_examples.rb
RSpec.shared_examples "a lookup table" do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:source) }
end
