
-- Création de la base de données
CREATE DATABASE IF NOT EXISTS ombre_afrique;
USE ombre_afrique;

-- Table Employe
CREATE TABLE IF NOT EXISTS Employe (
    id_employe INT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    telephone VARCHAR(20),
    adresse TEXT,
    poste VARCHAR(30),
    salaire DECIMAL(10,2),
    date_embauche DATE
);

INSERT INTO Employe VALUES
(1001, 'Mahamat', 'Sileh', '66221100', 'Abéché centre', 'Gérant', 250000.00, '2021-05-01'),
(1002, 'Abakar', 'Saleh', '66221101', 'Abéché nord', 'Cuisinier', 150000.00, '2022-01-10'),
(1003, 'Ousmane', 'Djimé', '66221102', 'Abéché est', 'Serveur', 100000.00, '2023-03-15');

-- Table Client
CREATE TABLE IF NOT EXISTS Client (
    id_client INT PRIMARY KEY,
    nom VARCHAR(50),
    telephone VARCHAR(20),
    adresse TEXT,
    preferences VARCHAR(100)
);

INSERT INTO Client VALUES
(2001, 'Ali', '66553300', 'Abéché nord', 'Sans gluten'),
(2002, 'Fatima', '66553301', 'Abéché sud', 'Végétarien'),
(2003, 'Brahim', '66553302', 'Abéché ouest', 'Halal');

-- Table TableRestaurant
CREATE TABLE IF NOT EXISTS TableRestaurant (
    id_table INT PRIMARY KEY,
    capacite INT,
    zone VARCHAR(50),
    etat ENUM('libre', 'occupée', 'réservée')
);

INSERT INTO TableRestaurant VALUES
(1, 4, 'Zone A', 'libre'),
(2, 6, 'Zone B', 'occupée'),
(3, 2, 'Zone A', 'réservée');

-- Table Plat
CREATE TABLE IF NOT EXISTS Plat (
    code_plat INT PRIMARY KEY,
    nom VARCHAR(50),
    description TEXT,
    prix DECIMAL(10,2),
    categorie VARCHAR(30),
    temps_preparation INT
);

INSERT INTO Plat VALUES
(3001, 'Salade Africaine', 'Salade de gombo avec arachide', 3500.00, 'Entrée', 10),
(3002, 'Poulet DG', 'Poulet sauce banane plantain', 7000.00, 'Plat principal', 20),
(3003, 'Beignets au miel', 'Dessert local au miel', 2500.00, 'Dessert', 15);

-- Table Commande
CREATE TABLE IF NOT EXISTS Commande (
    id_commande INT PRIMARY KEY,
    date_heure DATETIME,
    type_commande ENUM('sur place', 'à emporter', 'livraison'),
    id_employe INT,
    id_client INT,
    FOREIGN KEY (id_employe) REFERENCES Employe(id_employe),
    FOREIGN KEY (id_client) REFERENCES Client(id_client)
);

INSERT INTO Commande VALUES
(4001, '2025-05-26 12:45:00', 'sur place', 1001, 2001),
(4002, '2025-05-26 13:10:00', 'à emporter', 1002, 2002),
(4003, '2025-05-26 14:00:00', 'livraison', 1003, 2003);

-- Table ContenuCommande
CREATE TABLE IF NOT EXISTS ContenuCommande (
    id_commande INT,
    code_plat INT,
    quantite INT,
    PRIMARY KEY (id_commande, code_plat),
    FOREIGN KEY (id_commande) REFERENCES Commande(id_commande),
    FOREIGN KEY (code_plat) REFERENCES Plat(code_plat)
);

INSERT INTO ContenuCommande VALUES
(4001, 3001, 2),
(4001, 3002, 1),
(4002, 3002, 2),
(4003, 3003, 3);

-- Table Facture
CREATE TABLE IF NOT EXISTS Facture (
    id_facture INT PRIMARY KEY,
    date DATE,
    montant_ht DECIMAL(10,2),
    taxes DECIMAL(10,2),
    montant_ttc DECIMAL(10,2),
    mode_paiement ENUM('espèces', 'carte bancaire', 'mobile money'),
    id_commande INT,
    FOREIGN KEY (id_commande) REFERENCES Commande(id_commande)
);

INSERT INTO Facture VALUES
(5001, '2025-05-26', 14000.00, 2520.00, 16520.00, 'espèces', 4001),
(5002, '2025-05-26', 14000.00, 2520.00, 16520.00, 'carte bancaire', 4002),
(5003, '2025-05-26', 7500.00, 1350.00, 8850.00, 'mobile money', 4003);

-- Table Fournisseur
CREATE TABLE IF NOT EXISTS Fournisseur (
    id_fournisseur INT PRIMARY KEY,
    nom VARCHAR(50),
    contact VARCHAR(50),
    specialite VARCHAR(100),
    conditions_paiement TEXT
);

INSERT INTO Fournisseur VALUES
(6001, 'Frais Tchad', '66554433', 'Légumes frais', 'Paiement à livraison'),
(6002, 'Boucherie Locale', '66554434', 'Viandes', 'Paiement à 15 jours'),
(6003, 'Sucrerie du Sahel', '66554435', 'Desserts et sucres', 'Paiement comptant');

-- Table Approvisionnement
CREATE TABLE IF NOT EXISTS Approvisionnement (
    id_appro INT PRIMARY KEY,
    date_livraison DATE,
    id_fournisseur INT,
    FOREIGN KEY (id_fournisseur) REFERENCES Fournisseur(id_fournisseur)
);

INSERT INTO Approvisionnement VALUES
(7001, '2025-05-25', 6001),
(7002, '2025-05-25', 6002),
(7003, '2025-05-25', 6003);
