DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions(
id SERIAL PRIMARY KEY,
region TEXT NOT NULL
);

INSERT INTO regions
(region)
VALUES
('San Francisco'),
('Atlanta'),
('Seattle'),
('Nashville');

CREATE TABLE users(
id SERIAL PRIMARY KEY,
username VARCHAR(18),
pref_region INT REFERENCES regions (id),
email TEXT NOT NULL
);

INSERT INTO users
(username, pref_region, email)
VALUES
('NashGuy', 4, 'Nashguy@gmail.com'),
('AtlGal', 2, 'Atlgal@gmail.com'),
('SFGuy', 1, 'SFguy@gmail.com'),
('SeaGal', 3, 'Seagal@gmail.com'),
('OtherGuy', 2, 'Otherguy@gmail.com'),
('OtherGal', 4, 'Othergal@gmai.com');


CREATE TABLE categories(
id SERIAL PRIMARY KEY,
category TEXT NOT NULL
);

INSERT INTO categories
(category)
VALUES
('Buy'),
('Sell'),
('Events'),
('Jobs');


CREATE TABLE posts(
id SERIAL PRIMARY KEY,
title TEXT NOT NULL,
category INT REFERENCES categories (id),
content TEXT NOT NULL,
region_id INT REFERENCES regions (id),
user_id INT REFERENCES users (id),
local_area TEXT NOT NULL
);

INSERT INTO posts
(title, content, category, region_id, user_id, local_area)
VALUES
('Bartender Downtown', 'Looking for a weekend bartender', 4, 4, 1, 'Downtown'),
('Used Tesla', 'Selling my 2021 Tesla Model S', 2, 3, 4, 'South Seattle'),
('WTB Text Book', 'Looking to buy a math textbook', 1, 2, 2, 'Northside'),
('Album Release Party', 'New album drops tonight!', 3, 4, 6, 'East Nashville'),
('WTS Used Cable Car', 'Cable car for sale, def not stolen', 2, 1, 3, 'Cable Car Tracks')
