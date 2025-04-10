CREATE TABLE styczen (
    WOJEWODZTWO INTEGER,
    MARKA TEXT,
    LICZBA INTEGER
);

SELECT*
FROM styczen


CREATE TABLE luty (
    WOJEWODZTWO INTEGER,
    MARKA TEXT,
    LICZBA INTEGER
);

ALTER TABLE luty
ALTER COLUMN WOJEWODZTWO TYPE TEXT;

COPY styczen 
FROM 'C:\Users\MateuszSz\Desktop\doc\PL_Car_registration\MARKI_OSOBOWE_2025_01.csv' DELIMITER ',' CSV HEADER;

COPY luty
FROM 'C:\Users\MateuszSz\Desktop\doc\PL_Car_registration\MARKI_OSOBOWE_2025_02.csv' DELIMITER ',' CSV HEADER;

ALTER TABLE styczen
ADD COLUMN MIESIAC TEXT;

ALTER TABLE luty
ADD COLUMN MIESIAC TEXT;

UPDATE styczen
SET miesiac = '1';

UPDATE luty
SET miesiac = '2';

SELECT*
FROM luty;

SELECT * FROM styczen
UNION ALL
SELECT * FROM luty;

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

-- nowa tabela zawierająca dane z całego 2025 roku 
CREATE TABLE ROK25 AS
SELECT * FROM styczen
UNION ALL
SELECT * FROM luty;

SELECT*
FROM ROK25;

-- nowa tabela zawierająca informacje o markach pojazdów
CREATE TABLE MARKI AS
SELECT DISTINCT MARKA 
FROM ROK25
ORDER BY marka;

-- nowa tabela zawierająca informacje o województwach 
CREATE TABLE WOJEWODZTWA AS
SELECT DISTINCT WOJEWODZTWO 
FROM ROK25
ORDER BY WOJEWODZTWO;

SELECT*
FROM wojewodztwa;