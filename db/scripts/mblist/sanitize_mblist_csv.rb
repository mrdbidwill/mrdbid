#!/usr/bin/env ruby
# frozen_string_literal: true

# Sanitize MBList.csv into a well-formed, consistently quoted CSV.
# - Tolerates bad quoting in input (quotes inside quotes, stray quotes)
# - Normalizes encoding to UTF-8 (accepting BOM)
# - Forces RFC-4180 quoting in output, escaping quotes by doubling them
# - Preserves embedded newlines in fields
#
# Usage:
#   ruby scripts/mblist/sanitize_mblist_csv.rb
# Defaults:
#   input:  db/scripts/mblist/output.csv
#   output: db/scripts/mblist/output_sanitized.csv
#   ruby db/scripts/mblist/sanitize_mblist_csv.rb

require 'csv'
require 'pathname'

input  = 'db/scripts/mblist/output.csv'
output = 'db/scripts/mblist/output_sanitized.csv'

puts "Sanitizing: #{input} -> #{output}"

read_opts = {
  headers: true,
  encoding: 'bom|utf-8',
  liberal_parsing: true,
  skip_blanks: false,
  return_headers: false
}

rows_enum = CSV.foreach(input, **read_opts)

# Capture headers from first row safely
headers = nil
buffered_rows = []
rows_enum.each_with_index do |row, idx|
  if idx == 0
    headers = row.headers
  end
  buffered_rows << row
  break if idx >= 0 # only buffer first row to get headers
end

abort 'Could not determine CSV headers' unless headers && !headers.empty?

# Prepare writer with consistent quoting and LF newlines
write_opts = {
  headers: headers,
  write_headers: true,
  force_quotes: true,
  encoding: 'UTF-8',
  row_sep: "\n",
  quote_char: '"'
}

CSV.open(output, 'w', **write_opts) do |csv|
  # write buffered first row
  buffered_rows.each do |row|
    csv << headers.map { |h| row[h] }
  end

  # write remaining rows
  CSV.foreach(input, **read_opts).with_index(0) do |row, idx|
    next if idx == 0 # already wrote first row
    csv << headers.map { |h| row[h] }
  rescue => e
    warn "Skipping malformed row #{idx + 2}: #{e.class} - #{e.message}"
  end
end

puts "Done. Wrote sanitized CSV: #{output}"
