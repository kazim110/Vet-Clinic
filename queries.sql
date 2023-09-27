/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'mon';

SELECT id, name, date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-30';

SELECT id, name, escape_attempts FROM animals WHERE escape_attempts < 3;

SELECT id, name, date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');

SELECT id, name, escape_attempts, weight_kg FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
