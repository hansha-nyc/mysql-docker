USE mydb;

CREATE TABLE mytable (
    front_yard VARCHAR(255),
    backyard VARCHAR(255),
    foyer VARCHAR(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/dataset.csv'
INTO TABLE mytable
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
