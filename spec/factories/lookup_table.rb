# spec/factories/lookup_table.rb
require_relative "../support/lookup_table_constants"

FactoryBot.define do
  LookupTableConstants::LOOKUP_TABLES.each do |table_name|
    factory table_name.to_s.singularize.to_sym do
      name { "#{table_name.to_s.singularize.titleize} Name" }
      description { "#{table_name.to_s.singularize.titleize} Description" }
      comments { "#{table_name.to_s.singularize.titleize} Comments" }
      source { 1 }
    end
  end
end
