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

BEGIN;
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
COMMIT;

BEGIN;
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');
COMMIT;

UPDATE animals SET species_id = CASE
WHEN name LIKE '%mon' THEN 2
ELSE 1
END;

BEGIN;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon' ,'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN  ('Devimon' ,'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander' ,'Squirtle' ,'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon' ,'Boarmon');
COMMIT;


BEGIN;
INSERT INTO vets (name, age, date_of_graduation) 
  VALUES ('William Tatcher',  45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');
END;


-- Insert data into the 'specializations' table

BEGIN;
INSERT INTO specializations (vet_id, species_id) 
  VALUES ((SELECT id FROM vets WHERE name='William Tatcher'),
     (SELECT id FROM species WHERE name='Pokemon')),
    ((SELECT id FROM vets WHERE name='Stephanie Mendez'),
     (SELECT id FROM species WHERE name='Digimon')),
    ((SELECT id FROM vets WHERE name='Stephanie Mendez'),
     (SELECT id FROM species WHERE name='Pokemon')),
    ((SELECT id FROM vets WHERE name='Jack Harkness'),
     (SELECT id FROM species WHERE name='Digimon'));    
END;

BEGIN;
INSERT INTO visits (vet_id, animal_id, visited) 
                    VALUES ((SELECT id FROM vets WHERE name='William Tatcher'),
    (SELECT id FROM animals WHERE name='Agumon'),
    '2020-05-24'),
    ((SELECT id FROM vets WHERE name='Stephanie Mendez'),
    (SELECT id FROM animals WHERE name='Agumon'),
    '2020-04-22'),
    ((SELECT id FROM vets WHERE name='Jack Harkness'),
    (SELECT id FROM animals WHERE name='Gabumon'),
    '2021-02-02'),
    ((SELECT id FROM vets WHERE name='Maisy Smith'),
    (SELECT id FROM animals WHERE name='Pikachu'),
    '2020-01-05'),
    ((SELECT id FROM vets WHERE name='Maisy Smith'),
    (SELECT id FROM animals WHERE name='Pikachu'),
    '2020-03-08'),
    ((SELECT id FROM vets WHERE name='Maisy Smith'),
    (SELECT id FROM animals WHERE name='Pikachu'),
    '2020-05-14'),
    ((SELECT id FROM vets WHERE name='Stephanie Mendez'),
    (SELECT id FROM animals WHERE name='Devimon'),
    '2021-05-04'),
    ((SELECT id FROM vets WHERE name='Jack Harkness'),
    (SELECT id FROM animals WHERE name='Charmander'),
    '2021-02-24'),
    ((SELECT id FROM vets WHERE name='Maisy Smith'),
    (SELECT id FROM animals WHERE name='Plantmon'),
    '2019-12-21'),
    ((SELECT id FROM vets WHERE name='William Tatcher'),
    (SELECT id FROM animals WHERE name='Plantmon'),
    '2020-08-10'),
    ((SELECT id FROM vets WHERE name='Maisy Smith'),
    (SELECT id FROM animals WHERE name='Plantmon'),
    '2021-04-07'),
    ((SELECT id FROM vets WHERE name='Stephanie Mendez'),
    (SELECT id FROM animals WHERE name='Squirtle'),
    '2019-09-29'),
    ((SELECT id FROM vets WHERE name='Jack Harkness'),
    (SELECT id FROM animals WHERE name='Angemon'),
    '2020-10-03'),
    ((SELECT id FROM vets WHERE name='Jack Harkness'),
    (SELECT id FROM animals WHERE name='Angemon'),
    '2020-11-04'),
    ((SELECT id FROM vets WHERE name='Maisy Smith'),
    (SELECT id FROM animals WHERE name='Boarmon'),
    '2019-01-24'),
    ((SELECT id FROM vets WHERE name='Maisy Smith'),
    (SELECT id FROM animals WHERE name='Boarmon'),
    '2019-05-15'),
    ((SELECT id FROM vets WHERE name='Maisy Smith'),
    (SELECT id FROM animals WHERE name='Boarmon'),
    '2020-02-27'),
    ((SELECT id FROM vets WHERE name='Maisy Smith'),
    (SELECT id FROM animals WHERE name='Boarmon'),
    '-2020-08-03'),
    ((SELECT id FROM vets WHERE name='Stephanie Mendez'),
    (SELECT id FROM animals WHERE name='Blossom'),
    '2020-05-24'),
    ((SELECT id FROM vets WHERE name='William Tatcher'),
    (SELECT id FROM animals WHERE name='Blossom'),
    '2021-01-11');
END;    