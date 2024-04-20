-- Active: 1713555979051@@127.0.0.1@3306@SnakeGame

/*
Dieses SQL Skript erstellt die Datenbank und die benötigten Tabellen für das SnakeGame Projekt.

Die Datenbank enthält folgende Tabellen:
- Spieler: Enthält Informationen über die Spieler, wie Name und E-Mail-Adresse.
- Spiel: Enthält Informationen über einzelne Spiele, wie Start- und Endzeit.
- Spielteilnahme: Verknüpft Spieler mit Spielen und speichert die Teilnahmeinformationen.
- Score: Speichert die Punktzahlen der Spieler für jedes Spiel.
- Session: Enthält Informationen über aktive Spieler-Sessions.

Um die Integrität der Daten zu gewährleisten, wurden die Tabellen über die folgenden
Fremdschlüssel miteinander verknüpft:
- Spielteilnahme.SpielID -> Spiel.SpielID
- Spielteilnahme.SpielerID -> Spieler.SpielerID
- Score.TeilnahmeID -> Spielteilnahme.TeilnahmeID
- Session.SpielerID -> Spieler.SpielerID

Die vorliegende Datenbank ist aktuell in der 3. Normalform, da alle Abhängigkeiten
funktional sind und es keine transitive Abhängigkeiten gibt.

Zusätzlich wurden Indizes für eine verbesserte Performance und Abfrageleistung erstellt.
*/

-- Löscht die Datenbank falls sie existiert
-- DROP DATABASE IF EXISTS SnakeGame;

-- Erstellt die Datenbank falls sie noch nicht existiert
CREATE DATABASE IF NOT EXISTS SnakeGame;
USE SnakeGame;

-- Tabelle für Spielerinformationen
CREATE TABLE IF NOT EXISTS Spieler (
    SpielerID INT AUTO_INCREMENT PRIMARY KEY
    , Username VARCHAR(255) NOT NULL
    , Email VARCHAR(255)
    , Password VARCHAR(255) NOT NULL
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
    ScoreID INT AUTO_INCREMENT PRIMARY KEY
    , TeilnahmeID INT
    , Punkte INT NOT NULL
    , FOREIGN KEY (TeilnahmeID) REFERENCES Spielteilnahme(TeilnahmeID)
    , INDEX (Punkte) -- Index zur schnellen Highscore-Abfrage
);

-- Tabelle für aktive Sessions von Spielern
CREATE TABLE IF NOT EXISTS Session (
    SessionID INT AUTO_INCREMENT PRIMARY KEY
    , SpielerID INT
    , Startzeit TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    , FOREIGN KEY (SpielerID) REFERENCES Spieler(SpielerID)
    , INDEX (Startzeit) -- Index für die Abfrage aktiver Sessions
);

-- Erstelle Indizes für eine verbesseerte Performance / Abfrageleistung
CREATE INDEX idx_Spiel_Startzeit ON Spiel (Startzeit);
CREATE INDEX idx_Spielteilnahme_SpielID ON Spielteilnahme (SpielID);
CREATE INDEX idx_Spielteilnahme_SpielerID ON Spielteilnahme (SpielerID);
CREATE INDEX idx_Score_TeilnahmeID ON Score (TeilnahmeID);
CREATE INDEX idx_Session_SpielerID ON Session (SpielerID);
CREATE INDEX idx_Session_Startzeit ON Session (Startzeit);
