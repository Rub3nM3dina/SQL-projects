### If we would be working on Postgress SQL, we would have started creating the database, then connecting to it:
```
CREATE DATABASE universe;
c\ universe
```
### We create our first table, the galaxy table
```
CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY);
```
### Then we start to create the rest of the attributes
```
ALTER TABLE galaxy ADD COLUMN name VARCHAR(20);
ALTER TABLE galaxy ADD COLUMN galaxy_aliases VARCHAR(20);
ALTER TABLE galaxy ADD COLUMN galaxy_diameter_in_light_years INT;
ALTER TABLE galaxy ADD COLUMN has_blackhole BOOLEAN;
```
We can see that we have a typo in the last attribute, so let's rename it:
```
ALTER TABLE galaxy RENAME has_blackhole TO has_black_hole;
```
### Now we add data to the table
```
INSERT INTO galaxy(galaxy_id, name, galaxy_aliases, galaxy_diameter_in_light_years, has_black_hole) VALUES(1, 'Andromeda', 'Messier 31', 220000, TRUE), (2, 'Milky Way', NULL, 200000, TRUE), (3, 'Messier 83', 'Southern Pinwheel', 100000, TRUE);
INSERT INTO galaxy(galaxy_id, name, galaxy_aliases, galaxy_diameter_in_light_years, has_black_hole) VALUES(4, 'Klingdon Empire', NULL, NULL, FALSE), (5, 'Galactic Empire', NULL, NULL, FALSE), (6, 'Mass Effect Galaxy', NULL, NULL, FALSE);
```
### It is time to create our star table and its attributes
```
CREATE TABLE star(star_id SERIAL UNIQUE NOT NULL PRIMARY KEY);
ALTER TABLE star ADD COLUMN galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id);
ALTER TABLE star ADD COLUMN name VARCHAR(20) NOT NULL;
ALTER TABLE star ADD COLUMN star_age_in_million_years INT NOT NULL;
ALTER TABLE star ADD COLUMN surface_temperature INT;
```
### Time to store data in the star table
```
INSERT INTO star(star_id, galaxy_id, name, star_age_in_million_years, surface_temperature) VALUES(1,1,'Alpharetz',100,13000);
INSERT INTO star(star_id, galaxy_id, name, star_age_in_million_years, surface_temperature) VALUES(2,1,'Mirach',200,12000), (3,1,'Almach',90,22000),(4,1,'Delta Andromedae',1100,15000);
INSERT INTO star(star_id, galaxy_id, name, star_age_in_million_years, surface_temperature) VALUES(5,2,'UY Scuti',10,5000), (6,2,'VY Canis Majoris',17,3490), (7,2,'RW Cephei',4,3500),(8,2,'The Sun',4600,5778);
INSERT INTO star(star_id, galaxy_id, name, star_age_in_million_years, surface_temperature) VALUES(9,3,'Alkaid', 300, 10000), (10,3,'Mizar', 450, 10200), (11,4,'Kronos Prime',5000,5200), (12,4,'Praxis Prime',1500,6300);
INSERT INTO star(star_id, galaxy_id, name, star_age_in_million_years, surface_temperature) VALUES(13,5,'Coruscant Prime', 6000,5500), (14,5,'Alderaan Star',3500,5800), (15,6,'Widow',100, 7900), (16,6,'Tasale',400,8100), (17,6,'Aralakh',7000,4800);
```
