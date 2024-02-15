#normalization report  
  
##Part 1: Normalizing to 1NF  
Process: 1. start by creating a table Parks_Info to store park
information, including park names and associated facilities.  
2. insert the data into the Parks_Info table.  
3. identify repeating groups (facilities) within the Parks_Info table
and split them into separate tables (Parks and Facilities) to eliminate
redundancy.  
4. create a Parks table to store unique park names.  
5. create a Facilities table to store unique facilities, linked to parks
through a foreign key.  
6. populate the Parks table with unique park names and the Facilities
table with facility information, associating each facility with its
corresponding park.  
Rationale:the process eliminate redundancy and improve data integrity by
organizing data into separate tables and ensuring each table represents
a single entity (park or facility), each table has a primary key and
that data is atomic.  
##Part 2: 2NF  
Process: 1. Create Related Tables, create a ParkFacilities table to
store unique facility names.  
2. add a new column ParkFacilityID to the Facilities table to reference
ParkFacilities.  
3. create a foreign key constraint between Facilities and ParkFacilities
to ensure referential integrity.  
4. update the Facilities table to set ParkFacilityID based on the
corresponding FacilityID from ParkFacilities.  
5. remove redundant columns,FacilityName from the Facilities table.  
By separating the facility names into a separate table ParkFacilities
and referencing them in the Facilities table, remove partial
dependencies and ensure that each non-key attribute is fully
functionally dependent on the primary key.  
  
![Alt text for the image](Facilities.png)  
![Alt text for the image](ParkFacilities.png)  
![Alt text for the image](Parks.png)  
![Alt text for the image](Parks_Info.png)