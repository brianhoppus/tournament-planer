-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


-- Remove any existing data from the database
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament;

-- Create our two primary tables, Players and Matches
CREATE TABLE Players (
    id serial primary key,
    name text
);
CREATE TABLE Matches (
    id serial primary key,
    winner INT,
    loser INT,
    foreign key (winner) references Players(id),
    foreign key (loser) references Players(id)
);

-- Create Standings, a view constructed from find the number of matches played 
-- and won by each player
CREATE VIEW Standings AS
SELECT players.id, players.name,
(SELECT count(*) FROM Matches WHERE players.id = winner) AS wins,
(SELECT count(*) FROM Matches WHERE players.id IN (winner, loser)) AS matches
FROM Players
GROUP BY id;
