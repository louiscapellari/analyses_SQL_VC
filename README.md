# Analyses SQL

## Identification des parcelles cadastrales concernées par les zones inondables recensées
**Nom du script associé :** `parcelles_zones_inondables.sql`  
**Thématique :** Risques naturels / Urbanisme  
**Outils utilisés :** PostgreSQL/PostGIS, QGIS (DB Manager), pgAdmin 4  

### Objectif 
L’objectif de cette analyse est d’identifier les parcelles cadastrales situées en contact ou incluses dans les zones inondables recensées dans le Plan de Prévention du Risque Inondation (PPRI). Ce croisement permet d’informer les décisions en matière d’aménagement, de construction et de gestion du territoire, notamment en zone à risque.</br>

### Données sources 
- **Parcellaire (IGN)** : `parcellaire.parcelle`  
- **Risque inondation (DDT)** : `risques.ppri`  

### Analyse
Une requête spatiale SQL a été réalisée pour effectuer l’analyse. La requête a été utilisée pour croiser les parcelles et les zones inondables selon deux critères géométriques :</br> 
- Le contact : la parcelle touche la zone inondable sans y être obligatoirement</br>
- L’intersection : la parcelle est partiellement ou totalement dans les zone inondable</br>

### Résultat 
La nouvelle table créée contient les parcelles exposées directement ou indirectement au risque d’inondation. </br>
<img width="2880" height="1524" alt="parcelles_inondations" src="https://github.com/user-attachments/assets/de18f2b4-84cb-4778-8b92-4b83ac136461" />

---

## Création d’une couche de parcelles regroupant tous les risques identifiés
**Nom du script associé :** `parcelles_avec_risques.sql`  
**Thématique :** Risques naturels / Urbanisme  
**Outils utilisés :** PostgreSQL/PostGIS, QGIS (DB Manager), pgAdmin 4  

### Objectif
Créer une nouvelle couche vectorielle regroupant toutes les parcelles cadastrales concernées par un ou plusieurs risques naturels ou géologiques, à partir de différentes sources thématiques.  
Cette couche permet de centraliser les risques par parcelle.

### Données sources
- **Parcellaire (IGN)** : `parcellaire.parcelle`  
- **Risque inondation (DDT)** : `risques.ppri`  
- **Risque montagne** : `risques.pprn`  
- **Risque géologique (structure)** : `risques.geo050k_harm_l_struct`  
- **Risque géologique (surcharge)** : `risques.geo050k_harm_s_surch`  
- **Mouvement de terrain** : `risques.mvmt_terrain`  

### Résultat
Une couche vectorielle affichant les parcelles à risques, contenant un ou plusieurs risques naturels ou géologiques, prête à être visualisée et analysée dans QGIS.
<img width="959" height="410" alt="parcelles_avec_risques" src="https://github.com/user-attachments/assets/e60b47d3-0f1f-4859-8b29-949da8cfd181" /> </br>

---

## Analyse des infrastructures électriques à Lanslebourg-Mont-Cenis 
**Nom du script associé :** `longueur_ligne_elec_et_nb_pylones_lanslebourg.sql` 
**Thématique :** Infrastructure de réseau 
**Outils utilisés :** PostgreSQL/PostGIS, QGIS (DB Manager), pgAdmin 4

### Objectif  
Calculer la longueur totale des lignes électriques et compter le nombre de pylônes électriques présents sur l’ancienne commune de Lanslebourg-Mont-Cenis. 

### Données sources 
- **Division cadastrale (IGN) :** `parcellaire.divcad`  
- **Lignes électriques (IGN) :** `energie.ligne_electrique`  
- **Pylônes (IGN) :** `energie.pylones`  

### Méthodologie 
A partir de la division cadastrale de l’IGN, on relève toutes les parcelles portant le nom “Lanslebourg-Mont-Cenis” pour ensuite calculer la longueur des lignes électriques comprises dans l’ancienne commune, et pour finir, compter le nombre de pylônes compris dans l’ancienne commune. 

### Résultat 
<img width="1782" height="788" alt="longueur_lignes_elec_et_nb_pylones_lanslebourg" src="https://github.com/user-attachments/assets/71807ae2-e773-4814-97dc-56d6f117424d" />

--- 


