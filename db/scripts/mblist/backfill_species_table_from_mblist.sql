INSERT IGNORE INTO species (genera_id, name, created_at, updated_at)
SELECT g.id, 
       SUBSTRING_INDEX(mb.taxon_name, ' ', -1),  -- last word as species epithet
       NOW(), NOW()
FROM mb_lists mb
JOIN genera g ON 
  CONVERT(g.name USING utf8mb4) COLLATE utf8mb4_0900_as_cs = 
  CONVERT(SUBSTRING_INDEX(mb.taxon_name, ' ', 1) USING utf8mb4) COLLATE utf8mb4_0900_as_cs
WHERE mb.rank_name IN ('sp.', 'species')
  AND mb.taxon_name IS NOT NULL
  AND mb.taxon_name LIKE '% %';