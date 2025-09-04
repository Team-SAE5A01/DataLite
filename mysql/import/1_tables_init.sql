SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `Assistant` (
  `id` int NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Client` (
  `id` int NOT NULL,
  `type_handicap` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `User` (
  `id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Indexes for dumped tables
--

--
-- Indexes for table `Assistant`
--
ALTER TABLE `Assistant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assistant`
--
ALTER TABLE `Assistant`
  ADD CONSTRAINT `Assistant_ibfk_1` FOREIGN KEY (`id`) REFERENCES `User` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`id`) REFERENCES `User` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Insert users with explicit ids that match your Client/Assistant rows
INSERT INTO `User` (id, nom, prenom, date_naissance, email, mot_de_passe, role) VALUES
(1,'Dupont','Jean','1990-05-12','jean.dupont@example.com','mdp123','client'),
(2,'Martin','Sophie','1985-09-25','sophie.martin@example.com','password','client'),
(3,'Lefevre','Thomas','1998-02-18','thomas.lefevre@example.com','thomaspass','client'),
(4,'Bernard','Alice','1993-07-07','alice.bernard@example.com','alicepwd','assistant'),
(5,'Morel','Luc','2000-11-03','luc.morel@example.com','lucpass','assistant');

INSERT INTO Client (id, type_handicap) VALUES
(1,'moteur'),
(2,'auditif'),
(3,'aucun');

INSERT INTO Assistant (id, disponible) VALUES
(4,1),
(5,0);