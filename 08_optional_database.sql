USE ROLE METABASE_USER_ROLE;

USE DATABASE METABASE_DB;
USE SCHEMA PUBLIC;
USE WAREHOUSE METABASE_WH;

CREATE OR REPLACE TABLE WEATHER (
    DATE DATE,
    LOCATION VARCHAR,
    TEMP_C NUMBER,
    TEMP_F NUMBER
);

INSERT INTO weather (DATE, LOCATION, TEMP_C, TEMP_F) 
    VALUES 
        ('2023-03-21', 'London', 15, NULL),
        ('2023-07-13', 'Manchester', 20, NULL),
        ('2023-05-09', 'Liverpool', 17, NULL),
        ('2023-09-17', 'Cambridge', 19, NULL),
        ('2023-11-02', 'Oxford', 13, NULL),
        ('2023-01-25', 'Birmingham', 11, NULL),
        ('2023-08-30', 'Newcastle', 21, NULL),
        ('2023-06-15', 'Bristol', 16, NULL),
        ('2023-04-07', 'Leeds', 18, NULL),
        ('2023-10-23', 'Southampton', 12, NULL);


USE ROLE ACCOUNTADMIN;

GRANT SELECT, INSERT ON TABLE PUBLIC.WEATHER TO ROLE METABASE_SERVICE_ROLE;
