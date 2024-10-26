DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;
 
CREATE TABLE petPet(
    petname VARCHAR(20) PRIMARY KEY,
    owner VARCHAR(45),
    species VARCHAR(45),
    gender ENUM ('M','F'),
    birth INTEGER(6),
    death INTEGER(6),
);
 
CREATE TABLE petEvent(
    petname VARCHAR(15),
    eventdate INTEGER(6),
    eventtype VARCHAR(15),
    remark VARCHAR(255),
    FOREIGN KEY (petname) REFERENCES petPet(petname)
    PRIMARY KEY 
);