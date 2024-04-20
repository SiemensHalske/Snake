#!/bin/bash

# Schwellenwert für die maximale CPU-Auslastung in Prozent
cpu_threshold=90

# Schwellenwert für den freien Festplattenspeicherplatz in GB
disk_threshold=5

# Überwache die CPU-Auslastung
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Überprüfe, ob die CPU-Auslastung den Schwellenwert überschreitet
if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l) )); then
    echo "Warnung: Die CPU-Auslastung liegt über $cpu_threshold%. Aktuelle Auslastung: $cpu_usage%"
    # Weitere Aktionen wie Benachrichtigungen oder Protokollierung können hier hinzugefügt werden
fi

# Überwache den freien Festplattenspeicherplatz
free_disk=$(df -h / | awk 'NR==2 {print $4}')

# Überprüfe, ob der freie Festplattenspeicherplatz den Schwellenwert unterschreitet
if (( $(echo "$free_disk < $disk_threshold" | bc -l) )); then
    echo "Warnung: Weniger als $disk_threshold GB freier Festplattenspeicher verfügbar. Aktuell verfügbar: $free_disk"
    # Weitere Aktionen wie Benachrichtigungen oder Protokollierung können hier hinzugefügt werden
fi
