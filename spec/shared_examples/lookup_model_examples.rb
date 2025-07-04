RSpec.shared_examples "a lookup model" do
  subject { build(source: create(:source)) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive.scoped_to(:source) }
end
