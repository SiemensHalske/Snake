#!/bin/bash

# Zielverzeichnis für Backups
backup_dir="/home/hendrik/SnakeGameBackup"

# Verzeichnis, das gesichert werden soll
source_dir="/home/hendrik/SnakeGame/"

# Aktuelles Datum für den Dateinamen des Backups
backup_date=$(date +"%Y-%m-%d")

# Erstelle das Backup-Verzeichnis, falls es nicht existiert
mkdir -p "$backup_dir"

# Führe die Sicherung durch
cp -r "$source_dir" "$backup_dir/backup_$backup_date"