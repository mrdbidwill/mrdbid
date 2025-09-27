-- MySQL bulk import template for MBList_sanitized.csv
-- Run from mysql client with LOCAL INFILE enabled:
--   SET GLOBAL local_infile = 1; -- requires privileges
--   mysql --local-infile=1 -u mrdbid_user -p mrdbid_development


LOAD DATA LOCAL INFILE '/Users/wrj/Documents/www/public_html/mrdbid/db/scripts/mblist/short_output_sanitized.csv'
INTO TABLE mb_lists
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
  ENCLOSED BY '"'
  ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
  mblist_id,
  taxon_name,
  authors,
  rank_name,
  year_of_effective_publication,
  name_status,
  mycobank_number,
  hyperlink,
  classification,
  current_name,
  synonymy
);
