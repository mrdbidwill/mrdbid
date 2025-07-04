# scripts/rename_migrations.rb
require "fileutils"

# Get today's datestamp
today = Time.now.strftime("%Y%m%d")

# Path to the migration directory
migration_dir = File.join(Dir.pwd, "db", "migrate")

# Fetch all migration files and sort them to maintain order
migration_files = Dir.entries(migration_dir)
  .select { |file| file.match(/^\d+_.*\.rb$/) }
  .sort

# Exit if no migration files are found
if migration_files.empty?
  puts "No migration files found in #{migration_dir}"
  exit
end

# Sequentially rename the files
migration_files.each_with_index do |file, index|
  # Generate the new filename
  sequence_number = format("%06d", index + 1)
  original_filename_suffix = file.sub(/^\d+_/, "") # Remove existing timestamp and underscore
  new_filename = "#{today}#{sequence_number}_#{original_filename_suffix}"

  # Absolute paths for renaming
  old_filepath = File.join(migration_dir, file)
  new_filepath = File.join(migration_dir, new_filename)

  # Rename the file
  FileUtils.mv(old_filepath, new_filepath)

  puts "Renamed: #{file} -> #{new_filename}"
end

puts "All migration files renamed successfully!"
