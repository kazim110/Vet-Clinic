/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT PRIMARY KEY NOT NULL,
    name text NOT NULL,
    date_of_birth date,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(4,2),
);

ALTER TABLE animals ADD COLUMN species VARCHAR;

CREATE TABLE owners (
    id INT PRIMARY KEY NOT NULL,
    full_name VARCHAR NOT NULL,
    age INT,
);

CREATE TABLE species (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR,
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD CONSTRAINT FK_ANIMALS FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT FOREIGN KEY (owners_id) REFERENCES owners(id);





