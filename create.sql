CREATE DATABASE IF NOT EXISTS RecipeDelight;

USE RecipeDelight;


-- Personell -------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Person(
    personID        INT AUTO_INCREMENT PRIMARY KEY,
    firstName       VARCHAR(255),
    lastName        VARCHAR(255),
    streetAddress   VARCHAR(255),
    city            VARCHAR(255),
    state           VARCHAR(2),
    zip             INT,
    phone           INT,
    email           VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Chef(
    chefID          INT AUTO_INCREMENT PRIMARY KEY,
    specialty       VARCHAR(255),
    salary          INT
) SELECT * FROM Person;

CREATE TABLE IF NOT EXISTS Student(
    studentID       INT AUTO_INCREMENT PRIMARY KEY,
    major           VARCHAR(255),
    expectedGrad    DATE
) SELECT * FROM Person;


-- Recipe ----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Recipe(
    recipeID        INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(255),
    pubDate         DATE,
    category        VARCHAR(255),
    cuisine         VARCHAR(255),
    numberServed    INT,
    instructions    VARCHAR(1024),
    specialTools    VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Ingredient(
    name            VARCHAR(32) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS RecipeIngredient(
    recipeID        INT NOT NULL,
    ingredientName  VARCHAR(32) NOT NULL,
                    PRIMARY KEY(recipeID, ingredientName),
    units           VARCHAR(32)
);

CREATE TABLE IF NOT EXISTS RecipeChef(
    recipeID        INT NOT NULL,
    chefID          INT NOT NULL,
                    PRIMARY KEY(recipeID, chefID)
);

CREATE TABLE IF NOT EXISTS RecipeStudent(
    recipeID        INT NOT NULL,
    studentID       INT NOT NULL,
                    PRIMARY KEY(recipeID, studentID)
);
