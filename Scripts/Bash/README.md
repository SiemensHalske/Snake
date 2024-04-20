# Bash-Skripte

Dieser Ordner enthält verschiedene Bash-Skripte zur Automatisierung von Aufgaben im System.

## Übersicht der Skripte

1. **reindex_db.sh**: Ein Skript zur Neuanzeige von Datenbankindizes beim Start des Systems.

2. **monitor_system.sh**: Ein Überwachungsskript, das wichtige Systemparameter oder Ressourcenauslastungen überprüft und bei Bedarf Warnungen sendet.

3. **cleanup_system.sh**: Ein Skript zur Systembereinigung, das temporäre Dateien löscht oder nicht benötigte Ressourcen freigibt, um den Speicherplatz zu optimieren.

4. **update_system.sh**: Ein Skript zur Automatisierung der Prüfung auf und Installation von Softwareupdates oder Patches.

5. **send_notifications.sh**: Ein Benachrichtigungsskript, das Benachrichtigungen oder Statusberichte per E-Mail oder anderen Kanälen sendet.

## Verwendung

Um ein Skript auszuführen, navigiere zu diesem Ordner und führe das entsprechende Skript aus:

```bash
./skriptname.sh
```

Stelle sicher, dass die Berechtigungen zum Ausführen der Skripte gesetzt sind:

bash
```bash
chmod +x skriptname.sh
```

Für weitere Informationen zur Verwendung einzelner Skripte siehe die Kommentare im Skriptcode.

### Automatisierung

Wenn die Skripte zu bestimmten Zeitpunkten automatisch laufen sollen, kannst du sie in die Crontab-Datei eintragen:

```bash
crontab -e
```

Füge eine Zeile hinzu, um das Skript zu planen:

```bash
0 3 * * * /pfad/zum/skriptname.sh
```

Dieses Beispiel führt das Skript täglich um 3 Uhr morgens aus. Passe die Zeit und den Pfad entsprechend an deine Anforderungen an.

Aufbau der Crontab-Zeile:

- Minute (0-59)
- Stunde (0-23)
- Tag des Monats (1-31)
- Monat (1-12)
- Wochentag (0-6, wobei 0 Sonntag ist)