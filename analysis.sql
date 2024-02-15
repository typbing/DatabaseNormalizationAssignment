CREATE EXTENSION postgis;

--part 1
--create table name Parks_Info with three columns
--ID, ParkName and Facilities
CREATE TABLE Parks_Info (
    ID SERIAL PRIMARY KEY,
    ParkName VARCHAR(255),
    Facilities VARCHAR(255)
);


--insert data(name and facilities) into the ‘Parks_Info'
INSERT INTO Parks_Info (ParkName, Facilities) VALUES
('Central Park', 'Playground, Restroom, Picnic area'),
('Liberty Park', 'Restroom, Picnic area'),
('Riverside Park', 'Playground, Bike Path');


CREATE TABLE Parks (
    ParkID SERIAL PRIMARY KEY,
    ParkName VARCHAR(255)
);


CREATE TABLE Facilities (
    FacilityID SERIAL PRIMARY KEY,
    ParkID INT,
    FacilityName VARCHAR(255),
    FOREIGN KEY (ParkID) REFERENCES Parks(ParkID)
);


--populate Parks with data split from Parks_Info
INSERT INTO Parks (ParkName)
SELECT DISTINCT ParkName FROM Parks_Info;


--populate Facilities with data split from Parks_Info
INSERT INTO Facilities (ParkID, FacilityName) VALUES
(1, 'Playground'),
(1, 'Restroom'),
(1, 'Picnic area'),
(2, 'Restroom'),
(2, 'Picnic area'),
(3, 'Playground'),
(3, 'Bike Path');


SELECT * FROM Parks_Info;
SELECT * FROM Parks;
SELECT * FROM Facilities;


-- Part 2: Creating Related Table, achieving 2NF Compliance
-- Create a table to hold unique park facilities
CREATE TABLE ParkFacilities (
    FacilityID SERIAL PRIMARY KEY,
    FacilityName VARCHAR(255)
);

-- Add a new column in the Facilities table to reference ParkFacilities
ALTER TABLE Facilities ADD COLUMN ParkFacilityID INT;


-- Establish a foreign key constraint between Facilities and ParkFacilities
ALTER TABLE Facilities
ADD CONSTRAINT fk_parkfacilityid FOREIGN KEY (ParkFacilityID) REFERENCES ParkFacilities(FacilityID);


-- Update Facilities table to set ParkFacilityID based on corresponding FacilityID
UPDATE Facilities
SET ParkFacilityID = (SELECT FacilityID FROM ParkFacilities WHERE FacilityName = Facilities.FacilityName);


-- Cleanup redundant columns by removing FacilityName from Facilities table
ALTER TABLE Facilities DROP COLUMN FacilityName;

INSERT INTO ParkFacilities (FacilityName) VALUES ('Playground'), ('Restroom'), ('Picnic area');

SELECT * FROM Facilities;
SELECT * FROM ParkFacilities;
