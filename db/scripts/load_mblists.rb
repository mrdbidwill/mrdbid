require "csv"

# Path to your CSV file
file_path = Rails.root.join("db", "scripts", "MBList.csv")

# Open and process the file
CSV.foreach(file_path, headers: true) do |row|
  MbList.create(
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
end
