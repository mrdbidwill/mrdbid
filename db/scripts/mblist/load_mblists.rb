require "csv"

# rails runner db/scripts/mblist/load_mblists.rb [--truncate] [optional_csv_path]
# Robust CSV loader for MBList with embedded quotes/newlines handling
# Defaults to db/scripts/mblist/output_sanitized.csv if present, otherwise db/scripts/mblist/output.csv

# Determine file path and flags
args = ARGV.dup
truncate = args.delete("--truncate").present? rescue args.delete("--truncate")
cli_path = args[0] && Pathname.new(args[0])

mblist_dir = Rails.root.join("db", "scripts", "mblist")
preferred = mblist_dir.join("output_sanitized.csv")
fallback  = mblist_dir.join("output.csv")

file_path = if cli_path && cli_path.exist?
  cli_path
elsif preferred.exist?
  preferred
elsif fallback.exist?
  fallback
else
  preferred
end

unless file_path.exist?
  abort "CSV file not found: #{file_path}. Provide a path or place short_output_sanitized.csv under db/scripts/mblist."
end

puts "Loading MBList from: #{file_path}"

if truncate
  puts "Truncating mb_lists..."
  MbList.delete_all
end

# Open and process the file with liberal parsing and BOM-safe UTF-8
options = {
  headers: true,
  encoding: "bom|utf-8",
  liberal_parsing: true,
  skip_blanks: true,
  return_headers: false
}

inserted = 0
failed = 0
line_no = 1 # header is line 1

begin
  CSV.foreach(file_path, **options) do |row|
    line_no += 1
    begin
      MbList.create!(
        mblist_id: row["mblist_id"],
        taxon_name: row["taxon_name"],
        authors: row["authors"],
        rank_name: row["rank_name"],
        year_of_effective_publication: row["year_of_effective_publication"],
        name_status: row["name_status"],
        mycobank_number: row["mycobank_number"],
        hyperlink: row["hyperlink"],
        classification: row["classification"],
        current_name: row["current_name"],
        synonymy: row["synonymy"]
      )
      inserted += 1
    rescue => e
      failed += 1
      warn "Row #{line_no} failed: #{e.class} - #{e.message}"
    end
  end
ensure
  puts "Done. Inserted=#{inserted}, Failed=#{failed}"
end
