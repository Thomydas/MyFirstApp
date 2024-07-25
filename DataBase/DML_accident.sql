--CREATE DATABASE accidentDB
--GO

USE accidentDB
GO

CREATE TABLE person(
   person_id INT IDENTITY(1,1),
   accident_number VARCHAR(100),
   person_category VARCHAR(100),
   gravity VARCHAR(100),
   gender VARCHAR(100),
   route VARCHAR(100),
   security VARCHAR(100),
   birth_year INT,
   vehicle_number VARCHAR(100),
   PRIMARY KEY(person_id)
);

CREATE TABLE holyday(
   holyday_id INT IDENTITY(1,1),
   holyday_date DATE,
   holyday_name VARCHAR(100),
   PRIMARY KEY(holyday_id)
);

CREATE TABLE place(
   place_id INT IDENTITY(1,1),
   accident_number VARCHAR(100) DEFAULT NULL,
   category VARCHAR(100),
   traffic_lane VARCHAR(100),
   circulation VARCHAR(100),
   reserved_lane VARCHAR(100),
   road_profile VARCHAR(100),
   road_plan VARCHAR(100),
   surface_condition VARCHAR(100),
   infrastructure VARCHAR(100),
   situation VARCHAR(100),
   PRIMARY KEY(place_id)
);

CREATE TABLE vehicle(
   vehicle_id INT IDENTITY(1,1),
   accident_number VARCHAR(100),
   obstacle VARCHAR(100),
   mobile_obstacle VARCHAR(100),
   shock_point VARCHAR(100),
   vehicle_number VARCHAR(50),
   PRIMARY KEY(vehicle_id)
);

CREATE TABLE accident(
   accident_id VARCHAR(100),
   accident_date DATETIME,
   luminosity VARCHAR(100),
   agglomeration VARCHAR(100),
   atmospheric VARCHAR(100),
   intersection VARCHAR(100),
   collision VARCHAR(100),
   place_id INT,
   PRIMARY KEY(accident_id),
   FOREIGN KEY(place_id) REFERENCES place(place_id)
);

CREATE TABLE participer(
   person_id INT,
   accident_id VARCHAR(100),
   PRIMARY KEY(person_id, accident_id),
   FOREIGN KEY(person_id) REFERENCES person(person_id),
   FOREIGN KEY(accident_id) REFERENCES accident(accident_id)
);

CREATE TABLE avoir(
   person_id INT,
   vehicle_id INT,
   PRIMARY KEY(person_id, vehicle_id),
   FOREIGN KEY(person_id) REFERENCES person(person_id),
   FOREIGN KEY(vehicle_id) REFERENCES vehicle(vehicle_id)
);

CREATE TABLE impliquer(
   accident_id VARCHAR(100),
   vehicle_id INT,
   PRIMARY KEY(accident_id, vehicle_id),
   FOREIGN KEY(accident_id) REFERENCES accident(accident_id),
   FOREIGN KEY(vehicle_id) REFERENCES vehicle(vehicle_id)
);

--DROP TABLE IF EXISTS impliquer;
--DROP TABLE IF EXISTS avoir;
--DROP TABLE IF EXISTS participer;
--DROP TABLE IF EXISTS accident;
--DROP TABLE IF EXISTS person;
--DROP TABLE IF EXISTS vehicle;
--DROP TABLE IF EXISTS place;
--DROP TABLE IF EXISTS holyday;
--DROP TABLE IF EXISTS holyday;