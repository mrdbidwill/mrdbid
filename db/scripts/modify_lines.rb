# Open the file (replace 'your_file.sql' with the actual path of your file)
file_path = 'db/scripts/insert_MO_characters_mod.sql'
lines = File.readlines(file_path)

# Initialize the starting number
starting_number = 112

# Process lines
File.open(file_path, 'w') do |file|
  lines.each_with_index do |line, index|
    # Add the prefix to every line after the first
    if index.zero?
      file.puts(line) # Write the first line as is
    else
      file.puts("(#{starting_number},'   #{line.strip}") # Add prefix and trim extra white spaces
      starting_number += 1 # Increment the number
    end
  end
end

puts "Prefix added and numbers incremented successfully!"
