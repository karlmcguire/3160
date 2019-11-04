CREATE DATABASE IF NOT EXISTS RecipeDelight;

USE RecipeDelight;

CREATE TABLE IF NOT EXISTS Person(
    personID      INT AUTO_INCREMENT PRIMARY KEY,
    firstName     VARCHAR(255),
    lastName      VARCHAR(255),
    streetAddress VARCHAR(255),
    city          VARCHAR(255),
    state         VARCHAR(2),
    zip           INT,
    phone         INT,
    email         VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Chef(
    chefID        INT AUTO_INCREMENT PRIMARY KEY,
    specialty     VARCHAR(255),
    salary        INT
) SELECT * FROM Person;

CREATE TABLE IF NOT EXISTS Student(
    studentID     INT AUTO_INCREMENT PRIMARY KEY,
    major         VARCHAR(255),
    expectedGrad  DATE
) SELECT * FROM Person;
