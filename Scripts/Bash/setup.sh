#!/bin/bash

# Funktion, um das Script bei Fehlern sofort zu beenden
set -e

# Hauptfunktionen des Setup-Skripts
. ./setup_aliases.sh
. ./install_apache.sh
. ./install_mariadb.sh
. ./configure_virtual_hosts.sh
. ./setup_users.sh

echo "Setup completed successfully."
