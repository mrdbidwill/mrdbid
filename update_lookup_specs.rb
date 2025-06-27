require "fileutils"

# Define the directory where request specs live
requests_dir = "spec/requests"

# Loop through each file in the directory
Dir.glob("#{requests_dir}/*.rb").each do |file|
  content = File.read(file)

  # Perform the search and replace operation
  new_content = content.gsub(
    /it_behaves_like "lookup table CRUD",\s+"(\w+)",\s+\{(.+?)\},\s+\{(.+?)\}/m,
    "let(:source) { create(:source) }\n\n  it_behaves_like \"lookup table CRUD\", \"\\1\", -> { {\\2} }, -> { {\\3} }"
  )

  # Write the updated content back to the file
  File.write(file, new_content)
  puts "Updated: #{file}"
end
