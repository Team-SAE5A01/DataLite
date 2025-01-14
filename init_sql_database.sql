CREATE TABLE Pmr (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    date_de_naissance DATE NOT NULL,
    type_handicap VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Accompagnateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pmr INT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    date_de_naissance DATE NOT NULL,
    lien_pmr VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pmr) REFERENCES Pmr(id)
);

CREATE TABLE Assistants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    date_de_naissance DATE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Transports (
    idTransport INT PRIMARY KEY,
    type VARCHAR(50),
    compagnie VARCHAR(100),
    modele VARCHAR(100),
    capacite INT
);

INSERT INTO Pmr (nom, prenom, date_de_naissance, type_handicap, email, mot_de_passe)
VALUES
('Dupont', 'Alice', '1985-03-10', 'Mobilité réduite', 'alice.dupont@example.com', 'mdp1234'),
('Martin', 'Jean', '1978-07-22', 'Déficience visuelle', 'jean.martin@example.com', 'securepwd'),
('Bernard', 'Claire', '1990-11-15', 'Déficience auditive', 'claire.bernard@example.com', 'audition456');

INSERT INTO Accompagnateur (id_pmr, nom, prenom, date_de_naissance, lien_pmr, email, mot_de_passe)
VALUES
(1, 'Dupont', 'Marie', '1960-05-18', 'Mère', 'marie.dupont@example.com', 'mdp123'),
(2, 'Lemoine', 'Paul', '1982-09-08', 'Frère', 'paul.lemoine@example.com', 'securepwd987'),
(3, 'Durand', 'Sophie', '1995-12-30', 'Ami', 'sophie.durand@example.com', 'ami567');

INSERT INTO Assistants (nom, prenom, date_de_naissance, email, mot_de_passe)
VALUES
('Moreau', 'Thomas', '1992-04-25', 'thomas.moreau@example.com', 'assist1'),
('Rousseau', 'Elise', '1988-10-13', 'elise.rousseau@example.com', 'assist2'),
('Petit', 'Lucas', '1995-01-20', 'lucas.petit@example.com', 'assist3');

INSERT INTO Transports (idTransport, type, compagnie, modele, capacite)
VALUES
(401, 'Train', 'SNCF', 'TGV', 300),
(402, 'Avion', 'Air France', 'Boeing 737', 180);
