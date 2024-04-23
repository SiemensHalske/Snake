#!/bin/bash

# Lösche temporäre Dateien im Home-Verzeichnis
echo "Lösche temporäre Dateien im Home-Verzeichnis..."
rm -rf /home/*/tmp/*

# Leere den Papierkorb
echo "Leere den Papierkorb..."
rm -rf /home/*/.local/share/Trash/*

# Lösche alte Logdateien
echo "Lösche alte Logdateien..."
find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;

echo "Systembereinigung abgeschlossen."
