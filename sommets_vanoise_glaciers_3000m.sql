DROP TABLE IF EXISTS environnement.sommets_vanoise_glaciers_3000m;
CREATE TABLE environnement.sommets_vanoise_glaciers_3000m AS
SELECT 
    s.* 
FROM 
    environnement.sommets s
JOIN 
    environnement.parcs_nationaux p 
    ON ST_Intersects(s.geom, p.geom)
JOIN 
    hydro.glacier g 
    ON ST_DWithin(s.geom, g.geom, 1000)
WHERE 
    s.elev2_1 >= 3000
    AND p.nom_site ILIKE 'Vanoise';


CREATE INDEX sommets_vanoise_glaciers_3000m_geom_idx 
ON environnement.sommets_vanoise_glaciers_3000m
USING GIST (geom);


