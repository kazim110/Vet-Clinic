/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'mon';

SELECT id, name, date_of_birth FROM animals WHERE '2019-12-30'> date_of_birth > '2016-01-01';

SELECT id, name, escape_attempts FROM animals WHERE escape_attempts < 3;

SELECT id, name, date_of_birth FROM animals WHERE namd IN ('Agumon','Pikachu');

SELECT id, name, escape_attempts, weight_kg FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT 'Gabumon';
SELECT * FROM animals WHERE 10,4 <= weight_kg <= 17,3;
