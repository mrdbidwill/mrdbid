require 'csv'

# Input and output file paths
input_file = "db/scripts/MBList.csv"
output_file = "db/scripts/MBList_updated.csv"

# Open and modify the CSV file
CSV.open(output_file, "w") do |csv|
  CSV.foreach(input_file, headers: true) do |row|
    row << "now()"
    row << "now()"
    csv << row
  end
end

puts "Updated file written to #{output_file}"
