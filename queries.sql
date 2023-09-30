/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'mon';

SELECT id, name, date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-30';

SELECT id, name, escape_attempts FROM animals WHERE escape_attempts < 3;

SELECT id, name, date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');

SELECT id, name, escape_attempts, weight_kg FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL OR species = '';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE * FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * (-1);
ROLLBACK TO sp1;
UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg < 0;
COMMIT;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT avg(weight_kg) FROM animals;
SELECT neutered, count(escape_attempts) FROM animals GROUP BY neutered;
SELECT neutered, max(escape_attempts) FROM animals GROUP BY neutered;
SELECT neutered, min(weight_kg) FROM animals GROUP BY neutered;
SELECT neutered, max(weight_kg) FROM animals GROUP BY neutered;
SELECT neutered, avg(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-30' GROUP BY neutered;


SELECT * FROM animals
JOIN owners ON animals.owners_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.id,animals.name FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'pokemon';

SELECT owners.full_name, animals.name 
FROM owners LEFT JOIN animals ON owners.id = animals.owners_id 
ORDER BY owners.full_name;

SELECT species.name, count(animals.id) from species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

SELECT species.name, count(animals.id) from species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.id, animals.name
FROM animals
JOIN owners ON animals.owners_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell'  AND species.name = 'digimon';


SELECT *  FROM animals
JOIN owners ON animals.owners_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, count(animals.id)
FROM owners LEFT JOIN animals ON owners.id = animals.owners_id
GROUP BY owners.full_name;

SELECT a.name  FROM visits as v 
JOIN animals AS a ON v.animal_id = a.id 
JOIN vets AS vt ON v.vet_id = vt.id 
WHERE vt.name = 'William Tatcher' 
ORDER BY v.date DESC LIMIT 1;

SELECT COUNT(DISTINCT v.animal_id) AS total_animals_seen 
FROM visits v 
JOIN vets vt ON v.vet_id = vt.id 
WHERE vt.name = 'Stephanie Mendez';

SELECT v.name AS vet_name, COALESCE(specialty, 'No Specialty') AS specialty
FROM vets v
LEFT JOIN (SELECT vet_id, STRING_AGG(species.name, ', ') AS specialty
FROM specializations
JOIN species ON specializations.species_id = species.id 
GROUP BY vet_id) s ON v.id = s.vet_id 
ORDER BY name, specialty;

SELECT a.name AS animal_name, v.date 
FROM visits v 
JOIN animals a ON v.animal_id = a.id 
WHERE v.vet_id = 3  AND v.date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name AS animal_name, COUNT(*) AS visit_count 
FROM visits v 
JOIN animals a ON v.animal_id = a.id 
GROUP BY a.name 
ORDER BY visit_count DESC LIMIT 1;

SELECT a.name AS animal_name 
FROM visits v 
JOIN animals a ON v.animal_id = a.id 
JOIN vets vt ON v.vet_id = vt.id 
WHERE vt.name = 'Maisy Smith'  
ORDER BY v.date ASC LIMIT 1;

SELECT a.name AS animal_name, vet.name AS vet_name, v.date 
FROM visits v 
JOIN animals a ON v.animal_id = a.id 
JOIN vets vet ON v.vet_id = vet.id 
ORDER BY v.date DESC LIMIT 1;

SELECT COUNT(*) AS mismatched_specialty_visits 
FROM visits v 
JOIN animals a ON v.animal_id = a.id 
JOIN vets vet ON v.vet_id = vet.id 
LEFT JOIN specializations s ON vet.id = s.vet_id AND a.species_id = s.species_id 
WHERE s.vet_id IS NULL;

SELECT s.name AS specialty 
FROM visits v JOIN animals a ON v.animal_id = a.id 
JOIN vets vt ON v.vet_id = vt.id 
LEFT JOIN specializations sp ON vt.id = sp.vet_id  AND a.species_id = sp.species_id  
JOIN species s ON a.species_id = s.id 
WHERE vt.name = 'Maisy Smith' 
GROUP BY s.name ORDER BY  COUNT(*) DESC LIMIT 1;