require "rails_helper"

RSpec.describe Odor, type: :model do
  puts "Running odor_spec"

  it_behaves_like "a lookup model" do
    puts "Trying shared example: a lookup model"
  end
end
