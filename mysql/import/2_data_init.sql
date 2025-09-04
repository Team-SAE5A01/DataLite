-- Insert users with explicit ids that match your Client/Assistant rows
INSERT INTO `User` (id, nom, prenom, date_naissance, email, mot_de_passe, role) VALUES
(1,'Dupont','Jean','1990-05-12','jean.dupont@example.com','mdp123','client'),
(2,'Martin','Sophie','1985-09-25','sophie.martin@example.com','password','client'),
(3,'Lefevre','Thomas','1998-02-18','thomas.lefevre@example.com','thomaspass','client'),
(4,'Bernard','Alice','1993-07-07','alice.bernard@example.com','alicepwd','assistant'),
(5,'Morel','Luc','2000-11-03','luc.morel@example.com','lucpass','assistant');

INSERT INTO Client (id, type_handicap) VALUES
(1,'moteur'),(2,'auditif'),(3,'aucun');

INSERT INTO Assistant (id, disponible) VALUES
(4,1),(5,0);