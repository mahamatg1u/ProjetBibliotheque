CREATE DATABASE IF NOT EXISTS `tpMHTN`;
USE `tpMHTN`;
CREATE TABLE IF NOT EXISTS `Etablissement` (
  `nometab` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  PRIMARY KEY (`nometab`)
);
 INSERT INTO `Etablissement` (`nometab`, `adresse`)
VALUES ('IDMC', '22 quai choiseul'),
       ('Campus Lettre', '14 rue bel'),
       ('UL','26 rue de Saurupt'),
       ('Artem','99 rue de Metz'),
       ('IAE','40 rue de Miel');
       
       
CREATE TABLE IF NOT EXISTS `Etudiant` (
	`numen` int NOT NULL, 
    `nom` varchar(30) NOT NULL,
    `prenom` varchar(30) NOT NULL,
    PRIMARY KEY(`numen`)
    );

INSERT INTO Etudiant (`numen`, `nom`, `prenom`)
VALUES 
(3221, 'Ichass', 'Garba'),
(3887, 'Nick', 'Tchiakpe'),
(3441, 'Hakim', 'Siameur'),
(3998, 'Seid', 'Ali'),
(3251, 'Fatima', 'Sow');
       
CREATE TABLE IF NOT EXISTS `Batiment` (
`IDnumbat` int NOT NULL,
`nom` varchar(50) NOT NULL,
`nometab` varchar(50) NOT NULL,
PRIMARY KEY (`IDnumbat`),
 FOREIGN KEY (`nometab`) REFERENCES `Etablissement`(`nometab`)
);

INSERT INTO `Batiment` (`IDnumbat`,`nom`,`nometab`)
VALUES (1,'A','Campus Lettre'),
(2,'B','UL'),
(3,'C','Artem'),
(4,'D','IDMC'),
(5,'E','IAE');


CREATE TABLE IF NOT EXISTS `Bibliotheque`(
 `IDnumbib` int NOT NULL,
 `nom` varchar(50) NOT NULL ,
  `nbrtotalouvrage1` int NOT NULL,
  `nometab` varchar(50) NOT NULL,
  `IDnumbat` int NOT NULL,
PRIMARY KEY(`IDnumbib`),
FOREIGN KEY (`nometab`) REFERENCES `Etablissement`(`nometab`),
FOREIGN KEY (`IDnumbat`) REFERENCES `Batiment`(`IDnumbat`) 
 );
 

INSERT INTO  `Bibliotheque` (`IDnumbib`,`nom`,`nbrtotalouvrage1`,`nometab`,`IDnumbat`)
VALUES (35456,'BU Management',12563,'IAE',5),
(32599,'e-BU Manufacture',11457,'UL',2),
(47145,'Stanislas',14857,'UL',1),
(59643,'BU Sciences',9456,'IDMC',4),
(65322,'BU Histoire',22053,'Artem',3);


CREATE TABLE IF NOT EXISTS `AutreBibliotheque`(
 `IDnumautrebib` int NOT NULL,
 `nom` varchar(50) NOT NULL ,
  `nbrtotalouvrage2` int NOT NULL,
  PRIMARY KEY(`IDnumautrebib`)
);
  
  
INSERT INTO  `AutreBibliotheque` (`IDnumautrebib`,`nom`,`nbrtotalouvrage2`)
VALUES (1,'Liberation',2565),
(2,'Avenue',14563),
(3,'Ombelles',12225),
(4,'Anarchie',10247),
(5,'Morale',8547);



CREATE TABLE IF NOT EXISTS `Collaboration`  (
`IDnumbib` int NOT NULL,
  `IDnumautrebib` int NOT NULL,
   `date_debut` date NOT NULL,
    `date_fin` date NOT NULL, 
  
  FOREIGN KEY (`IDnumbib`) REFERENCES `Bibliotheque`(`IDnumbib`),
  FOREIGN KEY (`IDnumautrebib`) REFERENCES `AutreBibliotheque`(`IDnumautrebib`),
  PRIMARY KEY (`IDnumbib`,`IDnumautrebib`)
  );
  
  INSERT INTO `Collaboration`  (`IDnumbib`,`IDnumautrebib`, `date_debut`,`date_fin`)
  VALUES 
  (35456,1,'2023-12-21','2025-12-21'),
  (32599,2,'2023-05-14','2025-05-14'),
  (47145,3,'2023-10-16','2024-10-16'),
  (59643,4,'2020-03-06','2024-01-02'),
  (65322,5,'2023-02-04','2027-04-05');
  
  
CREATE TABLE IF NOT EXISTS `Ouvrage` (
	`numISBN` varchar(50) NOT NULL,
    `titre` varchar(30) NOT NULL,
    `nom_auteur` varchar(30) NOT NULL, 
    `prenom_auteur` varchar(30) NOT NULL,
    `nom_editeur` varchar(30) NOT NULL,
    `adresse` varchar(30) NOT NULL, 
    PRIMARY KEY (`numISBN`)
);
INSERT INTO `OUVRAGE`  (`numISBN`,`titre` , `nom_auteur` ,  `prenom_auteur`,  `nom_editeur`, `adresse`)
values
('978-2-426-00627-2','L’affaire Bissi','Barnabé-Akayi','Daté Atavito','Ruisseaux d’Afrique','Cotonou'),
('978-2-426-00452-2','Un piège sans fin ','Bhêly-Quenum','Olympe','Présence Africaine','Paris'),
('978-2-426-00627-4','L’aube nouvelle','Dagnon','Gilbert Jean','Bénin Horizons','Cotonou'),
('978-2-426-00627-7','Entre justice et vengeance','Garcia','Jean','Columbus','Paris'),
('978-2-426-00627-30','La longue attente','Perrier','Onel',' Philliplume','Marseille');


CREATE TABLE IF NOT EXISTS `Exemplaire` (
	`IDnumbib` int NOT NULL,
    `numISBN` varchar(50) NOT NULL,
    `nbexemplaire` int NOT NULL,
	PRIMARY KEY(`IDnumbib`, `numISBN`),
    FOREIGN KEY(`IDnumbib`) REFERENCES `Bibliotheque`(`IDnumbib`),
    FOREIGN KEY(`numISBN`) REFERENCES `Ouvrage`(`numISBN`)
    );
    
    INSERT INTO  `Exemplaire` (`IDnumbib`, `numISBN`, `nbexemplaire`)
    VALUES (35456,'978-2-426-00627-7',143),
(35456,'978-2-426-00452-2',226),
(32599,'978-2-426-00627-2',445),
(32599,'978-2-426-00627-30',12),
(47145,'978-2-426-00627-2',257),
(47145,'978-2-426-00452-2',144),
(47145,'978-2-426-00627-4',58),
(47145,'978-2-426-00627-7',89),
(47145,'978-2-426-00627-30',147),
(59643,'978-2-426-00627-7',547),
(59643,'978-2-426-00627-2',214),
(65322,'978-2-426-00627-2',112),
(65322,'978-2-426-00627-30',25);

CREATE TABLE IF NOT EXISTS `Emprunt` (
	`numen` int NOT NULL,
    `numISBN` varchar(50) NOT NULL,
    `date_emprunt` date NOT NULL,
    `date_retour` date NOT NULL, 
    PRIMARY KEY(`numen`, `numISBN`),
    FOREIGN KEY(`numen`) REFERENCES `Etudiant`(`numen`),
    FOREIGN KEY(`numISBN`) REFERENCES `Ouvrage`(`numISBN`)
);


INSERT INTO  `Emprunt`(`numISBN`, `numen`, `date_emprunt`, `date_retour`)
VALUES 
('978-2-426-00627-2',3221,'2023-12-22','2024-01-22'),
('978-2-426-00452-2',3887,'2023-12-14','2024-01-14'),
('978-2-426-00627-4',3441,'2023-11-29','2023-12-29'),
('978-2-426-00627-7',3998,'2023-12-11','2024-01-11'),
('978-2-426-00627-30',3251,'2023-12-04','2024-11-04');


CREATE TABLE IF NOT EXISTS `Inscription` (
	`IDnumbib` int NOT NULL,
    `numen` int NOT NULL,
    `numinscription` int NOT NULL,
    PRIMARY KEY(`IDnumbib`,`numen`),
    FOREIGN KEY(`IDnumbib`) REFERENCES `Bibliotheque`(`IDnumbib`),
    FOREIGN KEY(`numen`) REFERENCES `Etudiant`(`numen`)
);

INSERT INTO  `Inscription` (`IDnumbib`, `numen`, `numinscription`)
VALUES 
(35456,3221, 4578),
(47145,3887, 5269),
(59643,3441, 8963),
(65322,3998, 7777),
(32599,3221, 8888);

 