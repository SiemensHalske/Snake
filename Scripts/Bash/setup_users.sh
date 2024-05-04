#!/bin/bash

# Setze das Skript so, dass es bei einem Fehler beendet wird
set -e

# Überprüfung und Einrichtung der Gruppe 'developers'
if ! grep -q "^developers:" /etc/group; then
    echo "Gruppe 'developers' wird erstellt..."
    sudo groupadd developers
else
    echo "Gruppe 'developers' existiert bereits."
fi

# Einrichtung der Benutzer
declare -a users=("hendrik" "florian" "jan" "gabriel")

for user in "${users[@]}"; do
    echo "Einrichtung des Benutzers: $user"

    # Benutzer hinzufügen, wenn er noch nicht existiert
    if ! id "$user" &>/dev/null; then
        sudo useradd -m -s /bin/bash -g developers "$user"
        echo "Benutzer $user wurde erstellt und zur Gruppe 'developers' hinzugefügt."
    else
        echo "Benutzer $user existiert bereits; überprüfe die Gruppenmitgliedschaft."

        # Stelle sicher, dass der Benutzer zur Gruppe 'developers' gehört
        sudo usermod -a -G developers "$user"
    fi
done

# Sicherstellen, dass das Verzeichnis /opt/Snake korrekt eingerichtet ist
echo "Einrichtung des Verzeichnisses /opt/Snake..."
sudo mkdir -p /opt/Snake
sudo chown :developers /opt/Snake
sudo chmod 775 /opt/Snake

echo "Benutzer- und Verzeichniseinrichtung abgeschlossen."
