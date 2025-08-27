# Analyses SQL

## Identification des parcelles cadastrales concernées par les zones inondables recensées
**Thématique :** Risques naturels / Urbanisme</br>
**Outils utilisés :** PostgreSQL/PostGIS, QGIS (DB Manager), pgAdmin 4</br>
**Objectif :** </br>
L’objectif de cette analyse est d’identifier les parcelles cadastrales situées en contact ou incluses dans les zones inondables recensées dans le Plan de Prévention du Risque Inondation (PPRI). Ce croisement permet d’informer les décisions en matière d’aménagement, de construction et de gestion du territoire, notamment en zone à risque.</br>

**Analyse :** 
Une requête spatiale SQL a été réalisée pour effectuer l’analyse. La requête a été utilisée pour croiser les parcelles et les zones inondables selon deux critères géométriques :</br> 
Le contact : la parcelle touche la zone inondable sans y être obligatoirement</br>
L’intersection : la parcelle est partiellement ou totalement dans les zone inondable</br>

**Résultats :** 
La nouvelle table créée contient les parcelles exposées directement ou indirectement au risque d’inondation. </br>

Screenshot à intégrer</br> 

Cela permet d’identifier les propriétaires concernés dans une démarche de prévention et de servir de base pour les diagnostics de vulnérabilité tout en offrant une vue précise et géoréférencée sur l’emprise du risque foncier.</br> 

## Création d’une couche de parcelles regroupant tous les risques identifiés.
**Thématique :** Risques naturels / Urbanisme
**Outils utilisés :** PostgreSQL + PostGIS, QGIS (DB Manager), pgAdmin 4

**Objectif :** 
Créer une nouvelle couche vectorielle regroupant toutes les parcelles cadastrales concernées par un ou plusieurs risques naturels ou géologiques à partir de différentes sources de données thématiques. Cette couche permet de centraliser les risques par parcelle.

**Données sources :** 
Parcellaire IGN : parcellaire.parcelle  
Risque inondation : risques.ppri
Risque montagne : risques.pprn
Risque géologique (structure) : risques.geo050k_harm_l_struct
Risque géologique (surcharge) : risques.geo050k_harm_s_surch
Mouvement de terrain : risques.mvmt_terrain

**Résultat :** 
Affichage cartographique des parcelles à risques contenant un ou plusieurs risques.


