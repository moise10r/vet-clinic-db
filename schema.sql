/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id              INT GENERATED ALWAYS AS IDENTITY,
    name            VARCHAR(50),
    date_of_birth   DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered        BOOLEAN,
    weight_kg       DECIMAL NOT NULL,
    PRIMARY KEY(ID)
);

ALTER TABLE animals ADD species VARCHAR(150);

CREATE TABLE owners (
  id         INT GENERATED ALWAYS AS IDENTITY,
  full_name  VARCHAR(100),
  age        INT,
  PRIMARY KEY(id)
);

CREATE TABLE species (
  id       INT GENERATED ALWAYS AS IDENTITY,
  name     VARCHAR(100),
  PRIMARY KEY(id)
);

ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owner_id INT; 
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id); 
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

-- Create a table named 'vets'
CREATE TABLE vets (
  id                 INT GENERATED ALWAYS AS IDENTITY,
  name               VARCHAR(50),
  age                INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specialization (
    species_id  INT,
    vets_id     INT,
    FOREIGN KEY (species_id) REFERENCES species (id),
    FOREIGN KEY (vets_id) REFERENCES vets (id),
    PRIMARY KEY (species_id, vets_id)
);
