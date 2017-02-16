CREATE VIEW taxon_name AS 
SELECT *, CONCAT(taxa.genus,' ',taxa.species,' ',taxa.subspecies) AS taxon_name FROM taxa;
