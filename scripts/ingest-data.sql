USE prof_data;

INSERT INTO gender (gender)
    SELECT DISTINCT gender
    FROM data_set;

INSERT INTO name (name)
    SELECT DISTINCT name
    FROM data_set;

INSERT INTO age (birth_year, death_year)
    SELECT birth_year,death_year
    FROM data_set;

INSERT INTO profession (profession)
    SELECT DISTINCT description
    FROM data_set;

INSERT INTO occupation (occupation_type)
    SELECT DISTINCT occupation
    FROM data_set;

INSERT INTO country (country)
    SELECT DISTINCT country
    FROM data_set;

INSERT INTO death_manner (AgeOfDeath, MannerOfDeath)
    SELECT AgeOfDeath, MannerOfDeath
    FROM data_set;

INSERT INTO person (name,gender,age,profession,occupation,country,death_manner)
    SELECT n.name_id,g.gender_id,a.age_id,p.profession_id,o.occupation_id,c.country_id,dm.manner_id
    FROM data_set ds
    LEFT JOIN name n ON ds.name = n.name
    LEFT JOIN gender g ON ds.gender = g.gender
    LEFT JOIN age a ON ds.birth_year = a.birth_year
    AND ds.death_year = a.death_year
    LEFT JOIN profession p ON ds.description = p.profession
    LEFT JOIN occupation o ON ds.occupation = o.occupation_type
    LEFT JOIN country c ON ds.country = c.country
    LEFT JOIN death_manner dm ON ds.AgeOfDeath = dm.AgeOfDeath
    AND ds.MannerOfDeath = dm.MannerOfDeath;