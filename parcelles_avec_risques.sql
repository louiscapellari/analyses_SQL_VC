-- Création de la table regroupant toutes les parcelles concernées par un ou plusieurs risques
CREATE TABLE risques.parcelles_avec_risques AS

-- Inondation
SELECT
    p.numero, p.feuille, p.section, p.code_dep, p.nom_com, p.code_com,  
    r.codezone::text, r.id_zone::text, r.id_gaspar::text,                
    r.nom, r.typereg, r.soumisalea,                                     
    r.nomfic, r.urlfic, r.srce_annee, r.nom_2,                          
    NULL::text AS descr,                                                
    NULL::text AS id_mvt, NULL::text AS num_insee, NULL::text AS lieu_dit, 
    NULL::text AS type_mvt, NULL::text AS fiabilite, NULL::text AS date_deb_mvt, NULL::text AS date_maj,
    'inondation' AS type_risque,                                        
    p.geom                                                             
FROM parcellaire.parcelle p
JOIN risques.ppri r
  ON ST_Intersects(p.geom, r.geom)

UNION ALL

-- Géologique - structure
SELECT
    p.numero, p.feuille, p.section, p.code_dep, p.nom_com, p.code_com,
    NULL::text, NULL::text, NULL::text, NULL::text, NULL::text, NULL::text,
    NULL::text, NULL::text, NULL::text, NULL::text,
    r.descr,                                                            
    NULL::text, NULL::text, NULL::text, NULL::text, NULL::text, NULL::text, NULL::text,
    'geologique_struct' AS type_risque,
    p.geom
FROM parcellaire.parcelle p
JOIN risques.geo050k_harm_l_struct r
  ON ST_Intersects(p.geom, r.geom)

UNION ALL

-- Géologique - surcharge
SELECT
    p.numero, p.feuille, p.section, p.code_dep, p.nom_com, p.code_com,
    NULL::text, NULL::text, NULL::text, NULL::text, NULL::text, NULL::text,
    NULL::text, NULL::text, NULL::text, NULL::text,
    r.descr,
    NULL::text, NULL::text, NULL::text, NULL::text, NULL::text, NULL::text, NULL::text,
    'geologique_surch' AS type_risque,
    p.geom
FROM parcellaire.parcelle p
JOIN risques.geo050k_harm_s_surch r
  ON ST_Intersects(p.geom, r.geom)

UNION ALL

-- Mouvement de terrain
SELECT
    p.numero, p.feuille, p.section, p.code_dep, p.nom_com, p.code_com,
    NULL::text, NULL::text, NULL::text, NULL::text, NULL::text, NULL::text,
    NULL::text, NULL::text, NULL::text, NULL::text,
    NULL::text,
    r.id_mvt::text, r.num_insee::text, r.lieu_dit, r.type_mvt, r.fiabilite, r.date_deb_mvt::text, r.date_maj::text,
    'mouvement_terrain' AS type_risque,
    p.geom
FROM parcellaire.parcelle p
JOIN risques.mvmt_terrain r
  ON ST_Intersects(p.geom, r.geom)

UNION ALL

-- Risques de montagne
SELECT
    p.numero, p.feuille, p.section, p.code_dep, p.nom_com, p.code_com,
    r.codezone::text, r.id_zone::text, r.id_gaspar::text, r.nom, r.typereg, NULL::text,
    NULL::text, NULL::text, NULL::text, NULL::text,
    NULL::text,
    NULL::text, NULL::text, NULL::text, NULL::text, NULL::text, NULL::text, NULL::text,
    'montagne' AS type_risque,
    p.geom
FROM parcellaire.parcelle p
JOIN risques.pprn r
  ON ST_Intersects(p.geom, r.geom);