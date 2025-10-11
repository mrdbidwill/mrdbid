INSERT INTO genera (mblist_id, taxon_name, created_at, updated_at)
SELECT MIN(mblist_id), taxon_name, NOW(), NOW()
FROM mb_lists
WHERE rank_name IN ('gen.', 'gen', 'genus')
  AND taxon_name IS NOT NULL
  AND taxon_name != ''
GROUP BY taxon_name
ON DUPLICATE KEY UPDATE updated_at = NOW();