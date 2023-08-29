-- SQLite database file
-- Database: universe.db

-- Galaxy table
CREATE TABLE galaxy(galaxy_id SERIAL UNIQUE NOT NULL PRIMARY KEY);

ALTER TABLE galaxy ADD COLUMN name VARCHAR(20);
ALTER TABLE galaxy ADD COLUMN galaxy_aliases VARCHAR(20);
ALTER TABLE galaxy ADD COLUMN galaxy_diameter_in_light_years INT;
ALTER TABLE galaxy ADD COLUMN has_blackhole BOOLEAN;

ALTER TABLE galaxy RENAME has_blackhole TO has_black_hole; --I changed the name of the last attribute

INSERT INTO galaxy(galaxy_id, name, galaxy_aliases, galaxy_diameter_in_light_years, has_black_hole) VALUES(1, 'Andromeda', 'Messier 31', 220000, TRUE), (2, 'Milky Way', NULL, 200000, TRUE), (3, 'Messier 83', 'Southern Pinwheel', 100000, TRUE);
INSERT INTO galaxy(galaxy_id, name, galaxy_aliases, galaxy_diameter_in_light_years, has_black_hole) VALUES(4, 'Klingdon Empire', NULL, NULL, FALSE), (5, 'Galactic Empire', NULL, NULL, FALSE), (6, 'Mass Effect Galaxy', NULL, NULL, FALSE);


-- Star table
CREATE TABLE star(star_id SERIAL UNIQUE NOT NULL PRIMARY KEY);

ALTER TABLE star ADD COLUMN galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id); -- We set galaxy_id as the foreign key
ALTER TABLE star ADD COLUMN name VARCHAR(20) NOT NULL;
ALTER TABLE star ADD COLUMN star_age_in_million_years INT NOT NULL;
ALTER TABLE star ADD COLUMN surface_temperature INT;

INSERT INTO star(star_id, galaxy_id, name, star_age_in_million_years, surface_temperature) VALUES(1,1,'Alpharetz',100,13000);
INSERT INTO star(star_id, galaxy_id, name, star_age_in_million_years, surface_temperature) VALUES(2,1,'Mirach',200,12000), (3,1,'Almach',90,22000),(4,1,'Delta Andromedae',1100,15000);
INSERT INTO star(star_id, galaxy_id, name, star_age_in_million_years, surface_temperature) VALUES(5,2,'UY Scuti',10,5000), (6,2,'VY Canis Majoris',17,3490), (7,2,'RW Cephei',4,3500),(8,2,'The Sun',4600,5778);
INSERT INTO star(star_id, galaxy_id, name, star_age_in_million_years, surface_temperature) VALUES(9,3,'Alkaid', 300, 10000), (10,3,'Mizar', 450, 10200), (11,4,'Kronos Prime',5000,5200), (12,4,'Praxis Prime',1500,6300);
INSERT INTO star(star_id, galaxy_id, name, star_age_in_million_years, surface_temperature) VALUES(13,5,'Coruscant Prime', 6000,5500), (14,5,'Alderaan Star',3500,5800), (15,6,'Widow',100, 7900), (16,6,'Tasale',400,8100), (17,6,'Aralakh',7000,4800);

-- Planet table
CREATE TABLE planet(planet_id SERIAL NOT NULL UNIQUE PRIMARY KEY);

ALTER TABLE planet ADD COLUMN star_id INT NOT NULL REFERENCES star(star_id); -- We set star_id as foreign key
ALTER TABLE planet ADD COLUMN name VACHAR(15) NOT NULL;
ALTER TABLE planet ADD COLUMN orbit_period_in_days NUMERIC(7,2);
ALTER TABLE planet ADD COLUMN is_real BOOLEAN NOT NULL;

SELECT star_id, name FROM star WHERE name='The Sun'; --Query to retrieve the star_id for The Sun star

INSERT INTO planet(planet_id, star_id, name, orbit_period_in_days, is_real) VALUES(1,8,'Mercury',87.97, TRUE);
INSERT INTO planet(planet_id, star_id, name, orbit_period_in_days, is_real) VALUES(2,8,'Venus',224.7,TRUE), (3,8,'Earth',365.25, TRUE), (4,8,'Mars',686.98,TRUE),(5,8,'Jupiter',4333,TRUE), (6,8,'Saturn',10759,TRUE), (7,8,'Uranus',30633,TRUE), (8,8,'Neptune',60182,TRUE);

SELECT star_id, name FROM star WHERE name='Kronos Prime'; --Query to retrieve the star_id for the Kronos Prime star

INSERT INTO planet(planet_id, star_id, name, orbit_period_in_days, is_real) VALUES(9,11,'Kronos',NULL,FALSE);

SELECT star_id, name FROM star WHERE name='Praxis Prime'; --Query to retrieve the star_id for the Kronos Prime star

INSERT INTO planet(planet_id, star_id, name, orbit_period_in_days, is_real) VALUES(10,12,'Praxis',NULL,FALSE);

SELECT star_id, name FROM star WHERE name='Coruscant Prime'; --Query to retrieve the star_id for the Coruscant Prime star

INSERT INTO planet(planet_id, star_id, name, orbit_period_in_days, is_real) VALUES(11, 13, 'Coruscant', 368, FALSE);

SELECT star_id, name FROM star WHERE name='Alderaan Star'; --Query to retrieve the star_id for the Alderaan Star star

INSERT INTO planet(planet_id, star_id, name, orbit_period_in_days, is_real) VALUES(12, 14, 'Alderaan', 364, FALSE);

SELECT star_id, name FROM star WHERE name='Widow'; --Query to retrieve the star_id for the Widow star

INSERT INTO planet(planet_id, star_id, name, orbit_period_in_days, is_real) VALUES(13, 15, 'Citadel', NULL, FALSE);

SELECT star_id, name FROM star WHERE name='Tasale'; --Query to retrieve the star_id for the Tasale star

INSERT INTO planet(planet_id, star_id, name, orbit_period_in_days, is_real) VALUES(14, 16, 'Illium', 254, FALSE);

SELECT star_id, name FROM star WHERE name='Aralakh'; --Query to retrieve the star_id for the Aralakh star

INSERT INTO planet(planet_id, star_id, name, orbit_period_in_days, is_real) VALUES(15, 17, 'Tuchanka', 254, FALSE);
UPDATE planet SET orbit_period_in_days=482 WHERE planet_id=15; --Upadted the orbit_period_in_days to 482

-- Moon table
CREATE TABLE moon(moon_id SERIAL NOT NULL UNIQUE PRIMARY KEY);

ALTER TABLE moon ADD COLUMN planet_id INT NOT NULL REFERENCES planet(planet_id);
ALTER TABLE moon ADD COLUMN name VARCHAR(15) NOT NULL;
ALTER TABLE moon ADD COLUMN discovery_year INT;

SELECT planet_id, name FROM planet WHERE name='Earth'; --Query to retrieve the planet_id for the planet Earth

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(1,3,'The Moon', NULL);

SELECT planet_id, name FROM planet WHERE name='Mars'; --Query to retrieve the planet_id for the planet Mars

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(2, 4, 'Phobos', 1877), (3, 4, 'Deimos', 1877);

SELECT planet_id, name FROM planet WHERE name='Jupiter'; --Query to retrieve the planet_id for the planet Jupiter

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(4,5,'Io',1610), (5,5,'Europa',1610), (6,5,'Ganymede',1610), (7,5,'Callisto',1610);

SELECT planet_id, name FROM planet WHERE name='Saturn'; --Query to retrieve the planet_id for the planet Saturn

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES (8,6,'Titan',1655), (9,6,'Enceladus',1789), (10,6,'Mimas',1789), (11,6,'Rhea',1672);

SELECT planet_id, name FROM planet WHERE name='Uranus'; --Query to retrieve the planet_id for the planet Uranus

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(12,7,'Miranda',1948), (13,7,'Ariel',1851), (14,7,'Umbriel', 1851), (15,7,'Titania',1787), (16,7,'Oberon',1787);

SELECT planet_id, name FROM planet WHERE name='Neptune'; --Query to retrieve the planet_id for the planet Neptune

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(17,8,'Triton',1846), (18,8,'Nereid',1949);

SELECT planet_id, name FROM planet WHERE name='Kronos'; --Query to retrieve the planet_id for the planet Kronos

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(19,9,'QoDaq', NULL), (20,9,'Kronos Minor', NULL);

SELECT planet_id, name FROM planet WHERE name='Praxis'; --Query to retrieve the planet_id for the planet Praxis

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(21,10,'Praxis Moon 1', NULL), (22,10,'Praxis Moon 2', NULL);

SELECT planet_id, name FROM planet WHERE name='Coruscant'; --Query to retrieve the planet_id for the planet Coruscant

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(23,11,'Corusca Moon', NULL);

SELECT planet_id, name FROM planet WHERE name='Alderaan'; --Query to retrieve the planet_id for the planet Alderaan

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(24,12,'Delaya', NULL);

SELECT planet_id, name FROM planet WHERE name='Illium'; --Query to retrieve the planet_id for the planet Illium

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(25,14,'Sereon',NULL), (26,14,'Esylium',NULL);

SELECT planet_id, name FROM planet WHERE name='Tuchanka'; --Query to retrieve the planet_id for the planet Tuchanka

INSERT INTO moon(moon_id, planet_id, name, discovery_year) VALUES(27,15,'Jatak',NULL);


