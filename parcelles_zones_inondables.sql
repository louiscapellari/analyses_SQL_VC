CREATE TABLE risques.parcelles_zones_inondables AS 
SELECT 

    p.numero,
    p.feuille,
    p.section,
    p.code_dep,
    p.nom_com,
    p.code_com,
    
    z.codezone,
    z.id_zone,
    z.id_gaspar,
    z.nom,
    z.typereg,
    z.soumisalea,
    z.nomfic,
    z.urlfic,
    z.srce_annee,
    z.nom_2,

    p.geom 
	
FROM 
    parcellaire.parcelle p
	
JOIN 
    risques.ppri z 
	
ON 
    ST_Touches(p.geom, z.geom) OR ST_Intersects(p.geom, z.geom); 