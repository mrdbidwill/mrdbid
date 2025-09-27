#  rails runner db/scripts/mblist/xlxs_to_csv.rb
# Ruby
require 'roo'
require 'csv'

xlsx_path = 'db/scripts/mblist/MBList.xlsx'
csv_path  = 'db/scripts/mblist/output.csv'

xlsx = Roo::Spreadsheet.open(xlsx_path)

# Optional: define your header to avoid surprises from XLSX
expected_headers = [
  'ID',
  'Taxon name',
  'Authors',
  'Rank.Rank name',
  'Year of effective publication',
  'Name status',
  'MycoBank #',
  'Hyperlink',
  'Classification',
  'Current name.Taxon name',
  'Synonymy'
]

CSV.open(csv_path, 'w', force_quotes: true, encoding: 'UTF-8') do |csv|
  # Write header explicitly
  csv << expected_headers

  # Start from second row if first is header; adjust if your XLSX has no header
  xlsx.each_row_streaming(offset: 1, pad_cells: true) do |row|
    values = row.map { |c| c&.value }
    # Ensure correct number of columns
    values = values[0, expected_headers.length] || []
    values.fill(nil, values.length...expected_headers.length)

    # Normalize text and encoding
    values = values.map do |v|
      s = v.to_s
      s = s.strip
      s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '')
    end

    csv << values
  end
end

puts "Conversion complete: #{csv_path}"