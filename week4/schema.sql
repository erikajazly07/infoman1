-- Task 1: Create Database
CREATE DATABASE IF NOT EXISTS infoman1_vetclinic;
USE infoman1_vetclinic;

-- Task 2: Core Tables
CREATE TABLE pet_owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number INT NOT NULL -- Intentionally INT for Task 5
);

CREATE TABLE pets (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    species VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    owner_id INT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES pet_owners(owner_id)
);

CREATE TABLE veterinarians (
    vet_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL
);

-- Task 3: Relationship Tables
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_date DATE NOT NULL,
    reason_for_visit VARCHAR(255) NOT NULL,
    pet_id INT NOT NULL,
    vet_id INT NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES pets(pet_id),
    FOREIGN KEY (vet_id) REFERENCES veterinarians(vet_id)
);

CREATE TABLE vaccination_records (
    pet_id INT NOT NULL,
    vaccine_name VARCHAR(50) NOT NULL,
    vaccination_date DATE NOT NULL,
    PRIMARY KEY (pet_id, vaccine_name, vaccination_date),
    FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);

-- Task 5: Fix phone_number data type
ALTER TABLE pet_owners MODIFY COLUMN phone_number VARCHAR(20) NOT NULL;