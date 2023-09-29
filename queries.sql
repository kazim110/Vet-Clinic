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
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL OR species = '';
COMMIT;

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
