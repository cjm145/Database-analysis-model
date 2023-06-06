USE prof_data;

DROP TABLE IF EXISTS gender;
DROP TABLE IF EXISTS name;
DROP TABLE IF EXISTS age;
DROP TABLE IF EXISTS death_manner;
DROP TABLE IF EXISTS profession;
DROP TABLE IF EXISTS occupation;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS person;

CREATE TABLE `gender` (
    `gender_id` INT NOT NULL AUTO_INCREMENT,
    `gender` VARCHAR(50),
    PRIMARY KEY (`gender_id`)
);

CREATE TABLE `name` (
    `name_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(125),
    PRIMARY KEY (`name_id`)
);

CREATE TABLE `age` (
    `age_id` INT NOT NULL AUTO_INCREMENT,
    `birth_year` INT,
    `death_year` INT DEFAULT NULL,
    PRIMARY KEY (`age_id`)
);

CREATE TABLE `occupation` (
    `occupation_id` INT NOT NULL AUTO_INCREMENT,
    `occupation_type` VARCHAR(255),
    PRIMARY KEY (`occupation_id`)
);

CREATE TABLE `death_manner` (
    `manner_id` INT NOT NULL AUTO_INCREMENT,
    `AgeOfDeath` INT,
    `MannerOfDeath` VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (`manner_id`)
);

CREATE TABLE `profession` (
    `profession_id` INT NOT NULL AUTO_INCREMENT,
    `profession` VARCHAR(255),
    PRIMARY KEY (`profession_id`)
);

CREATE TABLE `country` (
    `country_id` INT NOT NULL AUTO_INCREMENT,
    `country` VARCHAR(125),
    PRIMARY KEY (`country_id`)
);

CREATE TABLE `person` (
    `person_id` INT NOT NULL AUTO_INCREMENT,
    `name` INT,
    `gender` INT,
    `age` INT,
    `profession` INT,
    `occupation` INT,
    `country` INT,
    `death_manner` INT,
    PRIMARY KEY (`person_id`)
);
