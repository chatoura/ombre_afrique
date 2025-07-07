# 🍽️ Ombre d’Afrique – Système de gestion d’un restaurant

## 📝 Description du projet

**Ombre d’Afrique** est une application de gestion pour un restaurant basé à Abéché. Ce système permet de gérer les commandes, les plats, les approvisionnements, les clients, les employés, les factures, ainsi que les fournisseurs. Le projet inclut aussi des vues SQL pour analyser les performances du restaurant (commandes, chiffre d’affaires, stock, etc.).

## 🎯 Objectif

Ce projet a pour objectif de simuler un système d'information complet pour un restaurant, avec une base de données relationnelle, permettant :
- La gestion centralisée des commandes et clients
- Le suivi des plats commandés
- La visualisation du chiffre d'affaires
- Le suivi des approvisionnements et fournisseurs

Ce projet s'inscrit dans le cadre de ma formation en développement web et mobile et représente mon projet personnel.

📘 Modèle Conceptuel de Données (MCD) – Restaurant Ombre d’Afrique

Le Modèle Conceptuel de Données (MCD) du restaurant Ombre d’Afrique représente les principales entités du système et leurs relations. Il permet de structurer les informations essentielles liées à la gestion des clients, commandes, plats, paiements, etc.

📌 Entités principales :

Client : représente les clients du restaurant.

Commande : chaque client peut passer plusieurs commandes.

Plat : les plats proposés à la carte.

Paiement : chaque commande est associée à un paiement.

Catégorie : chaque plat appartient à une catégorie (entrée, plat principal, dessert...).

Employé : ceux qui gèrent les commandes ou servent les clients.

Table : les tables disponibles dans le restaurant.


🔗 Relations clés :

Un client peut effectuer plusieurs commandes.

Une commande peut contenir plusieurs plats (relation de type n-n via une entité associative, ex : Contenir).

Un plat appartient à une seule catégorie.

Une commande est liée à un paiement.

Un employé peut enregistrer plusieurs commandes.

Une commande est associée à une table.
🖼️ MCD (Image)

Voici l’image du MCD générée à l’aide de draw.io :

![Capture d’écran du 2025-07-07 12-23-19](https://github.com/user-attachments/assets/82074587-61ff-4d66-992d-cca166664dd5)

🧩 Modèle Logique de Données (MLD) – Restaurant Ombre d’Afrique

Le MLD est la traduction du MCD vers un format relationnel, en vue de sa mise en œuvre dans une base de données (par exemple MySQL ou PostgreSQL). Il détaille les tables, leurs attributs, clés primaires (PK), clés étrangères (FK) et les relations.

📋 Tables du système

1. client

Champ	Type	Clé

id_client	INT	PK
nom	VARCHAR	
prenom	VARCHAR	
telephone	VARCHAR	


2. commande

Champ	Type	Clé

id_commande	INT	PK
date_commande	DATE	
id_client	INT	FK → client(id_client)
id_employe	INT	FK → employe(id_employe)
id_table	INT	FK → table_restaurant(id_table)


3. plat

Champ	Type	Clé

id_plat	INT	PK
nom_plat	VARCHAR	
prix	DECIMAL	
id_categorie	INT	FK → categorie(id_categorie)


4. categorie

Champ	Type	Clé

id_categorie	INT	PK
nom_categorie	VARCHAR	


5. employe

Champ	Type	Clé

id_employe	INT	PK
nom_employe	VARCHAR	
poste	VARCHAR	


6. paiement

Champ	Type	Clé

id_paiement	INT	PK
montant	DECIMAL	
type_paiement	VARCHAR	
id_commande	INT	FK → commande(id_commande)


7. table_restaurant

Champ	Type	Clé

id_table	INT	PK
numero	INT	
nb_places	INT	


8. contenir (table associative entre commande et plat)

Champ	Type	Clé

id_commande	INT	PK, FK → commande(id_commande)
id_plat	INT	PK, FK → plat(id_plat)
quantite	INT 
💡 Remarque : Toutes les clés étrangères assurent l'intégrité référentielle entre les tables.

-- Table : client
CREATE TABLE client (
    id_client INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    telephone VARCHAR(20)
);

-- Table : personnel
CREATE TABLE personnel (
    id_personnel INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    poste VARCHAR(50)
);

-- Table : plat
CREATE TABLE plat (
    id_plat INT PRIMARY KEY AUTO_INCREMENT,
    nom_plat VARCHAR(100),
    prix DECIMAL(10,2)
);

-- Table : commande
CREATE TABLE commande (
    id_commande INT PRIMARY KEY AUTO_INCREMENT,
    date_commande DATE,
    id_client INT,
    id_personnel INT,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_personnel) REFERENCES personnel(id_personnel)
);

-- Table : ligne_commande (relation entre commande et plat)
CREATE TABLE ligne_commande (
    id_commande INT,
    id_plat INT,
    quantite INT,
    PRIMARY KEY (id_commande, id_plat),
    FOREIGN KEY (id_commande) REFERENCES commande(id_commande),
    FOREIGN KEY (id_plat) REFERENCES plat(id_plat)
);

📊 Requêtes SQL (illustrées par des captures d'écran)

Ce projet contient plusieurs requêtes SQL pour extraire des informations depuis la base de données. Voici quelques exemples des opérations effectuées :

✅ Affichage des plats disponibles par catégorie.

✅ Récupération des réservations faites sur une période donnée.

✅ Consultation de la liste des clients ayant effectué des commandes.

✅ Requête avec jointure entre commande, client et plat.


Les résultats de ces requêtes sont présentés dans le dossier des captures d’écran.




## ✅ Fonctionnalités

- Gestion des clients, employés, produits, fournisseurs, plats
- Enregistrement des commandes sur place, à emporter ou en livraison
- Liaison des commandes aux clients et employés
- Création de vues pour :
  - Le chiffre d’affaires par commande
  - Les détails des commandes
  - Le stock disponible
  - Les approvisionnements par fournisseur

---

## 🗂️ Arborescence du projet
ombre_afrique/
├── .git/ # Répertoire Git (initialisé)
├── README.md # Ce fichier
├── ombre_afrique.sql # Script SQL de création de la base et insertion des données
├── images/ # (optionnel) Schémas MCD/MLD/MPD ou captures d'écran
├── docs/ # (optionnel) Documentation technique ou utilisateur
└── exports/ # (optionnel) Exports de données ou résultats de requêtes

###Technologies
**MySQL** :Systéme de gestion de la base de données
 **SQL** : création des tables, relations et vues
- **Git** : versionnement du projet
- **Shell / Terminal** : exécution des scripts et commandes
- (Optionnel) **Diagrammes MCD/MLD/MPD** créés avec Draw.io
## ⚙️ Installation et exécution

1. Cloner le dépôt :
   ```bash
   git clone <url_du_dépôt>
   cd ombre_afrique


