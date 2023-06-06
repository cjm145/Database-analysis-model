USE prof_data;
DROP TABLE IF EXISTS data_set;

CREATE TABLE data_set (
    data_id INT,
    reference VARCHAR(10),
    name VARCHAR(125),
    description VARCHAR(255),
    gender VARCHAR(50),
    country VARCHAR(125),
    occupation VARCHAR(255),
    birth_year INT,
    death_year INT NULL,
    MannerOfDeath VARCHAR(50) NULL,
    AgeOfDeath INT
);

LOAD DATA INFILE '/home/coder/project/mid-term/profession-analysis/data/min_dataset.csv' 
INTO TABLE data_set 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;