INSERT IGNORE INTO genera (mblist_id, name, created_at, updated_at)
SELECT DISTINCT mblist_id, taxon_name, NOW(), NOW()
FROM mb_lists
WHERE rank_name IN ('gen.', 'gen', 'genus')
  AND taxon_name IS NOT NULL
  AND taxon_name != '';