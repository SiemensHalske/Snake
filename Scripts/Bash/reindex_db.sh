#!/bin/bash

# Verbindungsinformationen zur Datenbank
DB_HOST="localhost"
DB_USER="root"
DB_PASS="trainexistsuper"
DB_NAME="SnakeGame"

# Überprüfen, ob die MySQL-Client-Software installiert ist
if ! command -v mysql &> /dev/null; then
    echo "MySQL-Client-Software ist nicht installiert. Bitte installieren Sie sie und versuchen Sie es erneut."
    exit 1
fi

# Überprüfen, ob die Datenbankverbindung erfolgreich hergestellt werden kann
if ! mysql -h $DB_HOST -u $DB_USER -p$DB_PASS -e "SELECT 1" &> /dev/null; then
    echo "Fehler beim Herstellen der Verbindung zur Datenbank. Bitte überprüfen Sie die Verbindungsinformationen."
    exit 1
fi

# SQL-Befehl zum Neuindizieren der erstellten Indizes
SQL_QUERY="REINDEX DATABASE $DB_NAME;"

# Ausführen des SQL-Befehls
if ! mysql -h $DB_HOST -u $DB_USER -p$DB_PASS -e "$SQL_QUERY" &> /dev/null; then
    echo "Fehler beim Ausführen des SQL-Befehls. Bitte überprüfen Sie den Befehl und die Verbindungsinformationen."
    exit 1
fi

echo "Die Datenbank wurde erfolgreich neu indiziert."
