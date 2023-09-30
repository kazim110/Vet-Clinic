/* Populate database with sample data. */


INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1,'Agumon', '2020-08-03', 0, true, 10.23 ),
(2,'Gabumon', '2018-11-15', 2, true, 8 ),
(3,'Pikachu', '2021-01-07', 1, false, 15.04 ),
(4,'Devimon', '2017-05-12', 5, true, 11 ),
(5,'Charmander', '2020-02-08', 0, false, -11 ),
(6,'Plantmon', '2021-11-15', 2, true, -5.7 ),
(7,'Squirtle', '1993-04-02', 3, false, -12.13 ),
(8,'Angemon', '2005-06-12', 1, true, -45 ),
(9,'Boarmon', '2005-06-07', 7, true, 20.4 ),
(10,'Blossom', '1998-10-13', 3, true, 17 ),
(11,'Ditto', '2022-05-14', 4, true, 22 );


INSERT INTO owners (id, full_name, age)
VALUES (1,'Sam Smith',34),
(2,'Jennifer Orwell',19),
(3,'Bob',45),
(4,'Melody Pond',77),
(5,'Dean Winchester',14),
(6,'Jodie Winchester',38);

INSERT INTO species (id, name)
VALUES (1,'digimon'),
(2,'pokemon');

BEGIN;
UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE species_id IS NULL OR species_id = null;
SELECT * FROM animals;
COMMIT;

UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owners_id = 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owners_id = 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owners_id = 5 WHERE name IN ('Angemon','Boarmon');

INSERT INTO vets (id, name, age, date_of_graduation)
VALUES (1,'William Tatcher', 45, '2000-04-23'),
(2,'Maisy Smith', 26, '2019-01-17'),
(3,'Stephanie Mendez', 64, '1981-05-04'),
(4,'Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (id, vet_id, species_id)
VALUES (1,1,2),
(2,3,1),
(3,3,2),
(4,4,1);

INSERT INTO visits (id, date, vet_id, animal_id)
VALUES (1,'2020-05-24',1,1),
(2,'2020-04-22',3,1),
(3,'2021-02-02',4,2),
(4,'2020-01-05',2,3),
(5,'2020-03-08',2,3),
(6,'2020-05-14',2,3),
(7,'2021-05-04',3,4),
(8,'2021-02-24',4,5),
(9,'2019-12-21',2,6),
(10,'2020-08-10',1,6),
(11,'2021-04-07',2,6),
(12,'2019-09-29',3,7),
(13,'2020-10-03',4,8),
(14,'2020-11-04',4,8),
(15,'2019-01-24',2,9),
(16,'2019-05-15',2,9),
(17,'2020-02-27',2,9),
(18,'2020-08-03',2,9),
(19,'2020-05-24',3,10),
(20,'2021-01-11',1,10);
