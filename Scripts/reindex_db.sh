#!/bin/bash

# Verbindungsinformationen zur Datenbank
DB_HOST="localhost"
DB_USER="root"
DB_PASS="trainexistsuper"
DB_NAME="SnakeGame"

# SQL-Befehl zum Neuindizieren der erstellten Indizes
SQL_QUERY="REINDEX DATABASE $DB_NAME;"

# Ausführen des SQL-Befehls
mysql -h $DB_HOST -u $DB_USER -p$DB_PASS -e "$SQL_QUERY"
