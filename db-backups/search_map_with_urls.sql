use mosskey;

/*SELECT Taxa.Name, Taxa.id, Map.KeyCharacterId 
FROM Taxa, Map 
(FULL OUTER JOIN url ON Taxa.URLid = url.id)
WHERE Map.TaxaId = Taxa.id AND 
Map.KeyCharacterId IN ('5','4','22')
GROUP BY Taxa.Id;
*/

SELECT 
  Taxa.Name, 
  taxa.id,
  URL.name as url
FROM taxa
LEFT JOIN url ON taxa.urlid = url.id
JOIN map ON (map.TaxaId = taxa.id  AND
  Map.KeyCharacterId IN ('5','4','22'))
GROUP BY Taxa.Id;


