# scripts/update_lookup_specs.rb
require "fileutils"

def update_lookup_constants
  lookup_tables = File.read("config/initializers/lookup_tables.rb")
    .scan(/LOOKUP_TABLES = %w\[(.*?)\]/m).flatten.first.split

  File.open("spec/support/lookup_table_constants.rb", "w") do |file|
    file.puts "module LookupTableConstants"
    file.puts "  LOOKUP_TABLE_FACTORIES = %i["
    lookup_tables.each { |table| file.puts "    #{table.singularize}," }
    file.puts "  ].freeze"
    file.puts "end"
  end
end

update_lookup_constants
puts "Updated spec/support/lookup_table_constants.rb"
