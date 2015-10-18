-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament;

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
CREATE VIEW Standings AS
SELECT id, name,
(SELECT count(*) FROM Matches WHERE id = winner) AS wins,
(SELECT count(*) FROM Matches WHERE id IN (winner, loser)) AS matches
FROM Players
GROUP BY id;
