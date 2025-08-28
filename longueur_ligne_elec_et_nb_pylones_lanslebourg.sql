CREATE TABLE energie.stats_elec_lanslebourg AS

-- fusion de toutes les géométries correspondant à Lanslebourg-Mont-Cenis (ancienne commune) 
WITH commune_fusionnee AS (
    SELECT ST_Union(geom) AS geom
    FROM parcellaire.divcad
    WHERE nom_com ILIKE 'Lanslebourg-Mont-Cenis'  
),

-- calcul de la longueur des lignes électriques à l’intérieur de l'ancienne commune fusionnée
lignes_dans_commune AS (
    SELECT ST_Length(ST_Intersection(l.geom, c.geom)) AS longueur
    FROM energie.ligne_electrique l
    JOIN commune_fusionnee c ON ST_Intersects(l.geom, c.geom)  
),

-- comptage du nombre de pylônes électriques dans l'ancienne commune
pylones_dans_commune AS (
    SELECT COUNT(*) AS nb_pylones
    FROM energie.pylones p
    JOIN commune_fusionnee c ON ST_Within(p.geom, c.geom)  
)

-- restitution finale des deux indicateurs dans une seule ligne
SELECT 
    ROUND((SELECT SUM(longueur) FROM lignes_dans_commune)::numeric, 2) AS total_longueur_m,
    (SELECT nb_pylones FROM pylones_dans_commune) AS nb_pylones;
