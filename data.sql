/* Populate database with sample data. */

INSERT INTO animals (
  name, 
  date_of_birth, 
  weight_kg, 
  neutered, 
  escape_attempts) 
  VALUES (
    'Agumon',
    '2020-02-03',
    10.23,
    true,
    0
);

INSERT INTO animals (
  name, 
  date_of_birth, 
  weight_kg, 
  neutered, 
  escape_attempts) 
  VALUES (
    'Gabumon',
    '2018-11-15',
    8,
    true,
    2
);

INSERT INTO animals (
  name, 
  date_of_birth, 
  weight_kg, 
  neutered, 
  escape_attempts) 
  VALUES (
    'Pikachu',
    '2021-01-07',
    15.04,
    false,
    1
);

INSERT INTO animals (
  name, 
  date_of_birth, 
  weight_kg, 
  neutered, 
  escape_attempts) 
  VALUES (
    'Devimon',
    '2017-05-12',
    11,
    true,
    5
);

-- New animals
INSERT INTO animals (
  name, 
  date_of_birth, 
  weight_kg, 
  neutered, 
  escape_attempts) 
  VALUES (
    'Charmander',
    '2020-02-08',
    -11,
    false,
    0
);

INSERT INTO animals (
  name, 
  date_of_birth, 
  weight_kg, 
  neutered, 
  escape_attempts) 
  VALUES (
    'Plantmon',
    '2022-11-15',
    -5.7,
    true,
    2
);

INSERT INTO animals (name, 
date_of_birth, 
weight_kg, 
neutered, 
escape_attempts) 
VALUES (
    'Squirtle',
    '1993-04-02',
    -12.13,
    false,
    3
);

INSERT INTO animals (
  name, 
  date_of_birth, 
  weight_kg, 
  neutered, 
  escape_attempts) 
  VALUES (
    'Angemon',
    '2005-06-12',
    -45,
    true,
    1
);

INSERT INTO animals (
  name, 
  date_of_birth, 
  weight_kg, 
  neutered, 
  escape_attempts) 
  VALUES (
    'Boarmon',
    '2005-06-07',
    20.4,
    true,
    7
);

INSERT INTO animals (
  name, 
  date_of_birth, 
  weight_kg, 
  neutered, 
  escape_attempts) 
  VALUES (
    'Blossom',
    '1998-10-13',
    17,
    true,
    3
);

BEGIN TRANSACTION;
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');
COMMIT TRANSACTION;

UPDATE animals SET species_id = CASE
WHEN name LIKE '%mon' THEN 2
ELSE 1
END;

BEGIN TRANSACTION;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';
COMMIT TRANSACTION;