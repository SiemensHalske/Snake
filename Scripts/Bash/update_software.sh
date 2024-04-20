#!/bin/bash

# Aktualisiere die Paketliste
echo "Aktualisiere die Paketliste..."
apt update

# Führe Systemaktualisierungen durch
echo "Führe Systemaktualisierungen durch..."
apt upgrade -y

echo "Systemaktualisierung abgeschlossen."
