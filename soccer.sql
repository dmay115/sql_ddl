DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    city TEXT NOT NULL,
    coach TEXT NOT NULL,
    w INT NOT NULL,
    l INT NOT NULL,
    d INT NOT NULL
);

 INSERT INTO teams
    (team_name, city, coach, w, l, d)
 VALUES
    ('Red Team', 'Northville', 'Mr. Red', 0, 3, 0),
    ('Blue Team', 'Southville', 'Mr. Blue', 1, 1, 1),
    ('Green Team', 'Eastville', 'Mrs. Green', 3, 0, 0),
    ('Purple Team', 'Westville', 'Mrs. Purple', 1, 1, 1);

 CREATE TABLE players
 (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INT REFERENCES teams (id),
    jersey_number VARCHAR(3) NOT NULL
 );

 INSERT INTO players
 (first_name, last_name, team_id, jersey_number)
 VALUES
 ('Steve', 'Stevens', 4, '03'),
 ('Rebecca', 'Grant', 4, '12'),
 ('Sara', 'Grant', 4, '13'),
 ('Billie', 'Rodgers', 4, '58'),
 ('Frog', 'Frogman', 1, '19'),
 ('Pat', 'Neil', 1, '24'),
 ('Gina', 'Waller', 1, '20'),
 ('Phill', 'Green', 1, '61'),
 ('Tim', 'Timmy', 2, '91'),
 ('Aaron', 'Cooper', 2, '60'),
 ('Mandy', 'Ming', 2, '07'),
 ('Rob', 'Winks', 2, '94'),
 ('Hank', 'Young', 3, '02'),
 ('Norm', 'Dark', 3, '82'),
 ('Millie', 'Banks', 3, '17'),
 ('Blaise', 'Ledbetter', 3, '99');

 CREATE TABLE referees
 (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
 );

 INSERT INTO referees
 (first_name, last_name)
 VALUES
 ('Omar', 'Reed'),
 ('Tina', 'Warren'),
 ('Matt', 'Mathews'),
 ('Linda', 'Anderson'),
 ('Nancy', 'Heathers');

 CREATE TABLE matches
 (
    id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES teams (id),
    away_team_id INT REFERENCES teams (id),
    home_score INT NOT NULL,
    away_score INT NOT NULL,
    ref_1_id INT REFERENCES referees (id),
    ref_2_id INT REFERENCES referees (id)
 );

 INSERT INTO matches
 (home_team_id, away_team_id, home_score, away_score, ref_1_id, ref_2_id)
 VALUES
 (3, 1, 4, 0, 1, 2),
 (3, 2, 3, 1, 3, 2),
 (4, 3, 1, 6, 4, 1),
 (1, 4, 1, 2, 5, 3),
 (2, 4, 2, 2, 1, 2),
 (1, 2, 0, 3, 4, 5);

 CREATE TABLE goals
 (
    id SERIAL PRIMARY KEY,
    match_id INT REFERENCES matches (id),
    player_id INT REFERENCES players (id)
 );

 INSERT INTO goals
 (match_id, player_id)
 VALUES
 (1, 16),
 (1, 16),
 (1, 16),
 (1, 16),
 (2, 16),
 (2, 9),
 (2, 16),
 (2, 16),
 (3, 3),
 (3, 16),
 (3, 16),
 (3, 16),
 (3, 16),
 (3, 16),
 (3, 16),
 (4, 2),
 (4, 5),
 (4, 4),
 (5, 11),
 (5, 12),
 (5, 1),
 (5, 2),
 (6, 10),
 (6, 11),
 (6, 9);

CREATE TABLE league_dates
(
    id SERIAL PRIMARY KEY,
    starting_date DATE NOT NULL,
    ending_date DATE NOT NULL
);

INSERT INTO league_dates
(starting_date, ending_date)
VALUES
('05-05-2022', '10-05-2022');