INSERT INTO User (nom, prenom, date_de_naissance, email, mot_de_passe) VALUES
('Dupont', 'Jean', '1990-05-12', 'jean.dupont@example.com', 'mdp123'),
('Martin', 'Sophie', '1985-09-25', 'sophie.martin@example.com', 'password'),
('Lefevre', 'Thomas', '1998-02-18', 'thomas.lefevre@example.com', 'thomaspass'),
('Bernard', 'Alice', '1993-07-07', 'alice.bernard@example.com', 'alicepwd'),
('Morel', 'Luc', '2000-11-03', 'luc.morel@example.com', 'lucpass');

INSERT INTO Handicap (nom) VALUES
('Moteur'),
('Visuel'),
('Auditif'),
('Cognitif');

INSERT INTO Compagnie (nom) VALUES
('Compagnie Aide+'),
('Service Assistance Pro'),
('HandiCare Solutions');

INSERT INTO Client (id, id_handicap) VALUES
(1, 1),  -- Jean Dupont (handicap moteur)
(2, 3),  -- Sophie Martin (handicap auditif)
(3, NULL);  -- Thomas Lefevre (aucun handicap spécifié)

INSERT INTO Assistant (id, id_compagnie) VALUES
(4, 1),  -- Alice Bernard (travaille pour Compagnie Aide+)
(5, 2);  -- Luc Morel (travaille pour Service Assistance Pro)
