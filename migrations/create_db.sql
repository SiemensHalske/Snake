-- Erstellt die Datenbank falls sie noch nicht existiert
CREATE DATABASE IF NOT EXISTS SnakeGame;
USE SnakeGame;

-- Tabelle für Spielerinformationen
CREATE TABLE IF NOT EXISTS Spieler (
    SpielerID INT AUTO_INCREMENT PRIMARY KEY
    , Name VARCHAR(255) NOT NULL
    , Email VARCHAR(255)
    , UNIQUE (Email) -- Stellt sicher, dass jede E-Mail-Adresse einzigartig ist
);

-- Tabelle für einzelne Spiele
CREATE TABLE IF NOT EXISTS Spiel (
    SpielID INT AUTO_INCREMENT PRIMARY KEY
    , Startzeit TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    , Endzeit TIMESTAMP
    , INDEX (Startzeit, Endzeit) -- Index für eine schnellere Abfrage der Spielzeiten
);

-- Tabelle für die Teilnahme von Spielern an Spielen
CREATE TABLE IF NOT EXISTS Spielteilnahme (
    TeilnahmeID INT AUTO_INCREMENT PRIMARY KEY
    , SpielID INT
    , SpielerID INT
    , FOREIGN KEY (SpielID) REFERENCES Spiel(SpielID)
    , FOREIGN KEY (SpielerID) REFERENCES Spieler(SpielerID)
    , UNIQUE (SpielID, SpielerID) -- Stellt sicher, dass jeder Spieler nur einmal pro Spiel registriert wird
);

-- Tabelle für die Speicherung der Scores
CREATE TABLE IF NOT EXISTS Score (
    ScoreID INT AUTO_INCREMENT PRIMARY KEY,
    TeilnahmeID INT,
    Punkte INT NOT NULL,
    FOREIGN KEY (TeilnahmeID) REFERENCES Spielteilnahme(TeilnahmeID),
    INDEX (Punkte) -- Index zur schnellen Highscore-Abfrage
);

-- Tabelle für aktive Sessions von Spielern
CREATE TABLE IF NOT EXISTS Session (
    SessionID INT AUTO_INCREMENT PRIMARY KEY,
    SpielerID INT,
    Startzeit TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SpielerID) REFERENCES Spieler(SpielerID),
    INDEX (Startzeit) -- Index für die Abfrage aktiver Sessions
);
