# Raspberry Pi Einrichtungsdokumentation

## Inhaltsverzeichnis

- [Raspberry Pi Einrichtungsdokumentation](#raspberry-pi-einrichtungsdokumentation)
  - [Inhaltsverzeichnis](#inhaltsverzeichnis)
  - [Einrichtung von hilfreichen Bash-Aliasen](#einrichtung-von-hilfreichen-bash-aliasen)
  - [Apache Web Server Installation und Konfiguration](#apache-web-server-installation-und-konfiguration)
    - [Apache installieren](#apache-installieren)
    - [MariaDB installieren](#mariadb-installieren)
  - [Verzeichnis für gemeinsame Projektarbeit erstellen und Berechtigungen setzen](#verzeichnis-für-gemeinsame-projektarbeit-erstellen-und-berechtigungen-setzen)
    - [Klonen des Projekts in das Verzeichnis](#klonen-des-projekts-in-das-verzeichnis)
  - [Konfigurieren des Apache Virtual Hosts](#konfigurieren-des-apache-virtual-hosts)
    - [HTTP Virtual Host einrichten](#http-virtual-host-einrichten)
    - [HTTPS Virtual Host einrichten](#https-virtual-host-einrichten)
    - [Apache neustarten](#apache-neustarten)
  - [Fehlerbehebung](#fehlerbehebung)
    - [Überprüfen, ob Apache auf Port 443 lauscht](#überprüfen-ob-apache-auf-port-443-lauscht)
    - [Testen der HTTPS-Verbindung](#testen-der-https-verbindung)

## Einrichtung von hilfreichen Bash-Aliasen

Zur Optimierung der Arbeit in der Befehlszeile können spezifische Aliase in der `.bashrc`-Datei des Benutzers hinzugefügt werden. Diese Aliase erleichtern alltägliche Aufgaben wie das Navigieren in Verzeichnissen, die Verwaltung von Dateien und die Überwachung des Systems. Sie ermöglichen es, längere Befehle durch kurze und leicht zu merkende Kürzel zu ersetzen, was die Produktivität steigert und die Fehleranfälligkeit reduziert.

```bash
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Meine Standard-Aliase,
# weil wegen faul
alias c='clear'
alias cls='clear'

alias x='exit'

# cd alias
alias ..='cd ..'  # Gehe eine Ebene im Verzeichnisbaum nach oben
alias ...='cd ../..'  # Gehe zwei Ebenen nach oben
alias ....='cd ../../..'  # Gehe drei Ebenen nach oben
alias mkdir='mkdir -pv'  # Erstelle Verzeichnisse und zeige den Pfad an
alias df='df -h'  # Zeige die Speicherplatzbelegung in lesbaren Einheiten an
alias du='du -h'  # Zeige die Speichernutzung von Verzeichnissen in lesbaren Einheiten an

# System-Aliase
alias top='htop'  # Nutze htop anstelle von top für eine detailliertere Ansicht (htop muss installiert sein)
alias meminfo='free -m -l -t'  # Zeige RAM- und Swap-Nutzung
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'  # Verbessertes Prozesssuchen

# Netzwerk-Aliase
alias ports='netstat -tulanp'  # Zeige alle offenen Ports
alias ipinfo='curl ipinfo.io'  # Schnelle IP Adress- und Netzwerkinformationen von extern
alias myip='curl ipinfo.io/ip'  # Zeige nur die eigene externe IP-Adresse

# Apt-Aliase
alias aptu='sudo apt update'  # Aktualisiere die Paketliste
alias apti='sudo apt install'  # Installiere ein Paket
alias aptr='sudo apt remove'  # Entferne ein Paket
alias aptc='sudo apt clean'  # Lösche den Cache
alias aptl='apt list --upgradable'  # Zeige aktualisierbare Pakete
alias aptg='sudo apt upgrade'  # Führe ein Upgrade durch

# Git-Aliase
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gcl='git clone'
alias gco='git checkout'
alias gcb='git checkout -b'
alias glog='git log --oneline --decorate --graph --all'  # Zeigt eine übersichtliche Git-Historie

# Nützliche Aliase für den Umgang mit Dateien und Verzeichnissen
alias c='clear'  # Schnelles Säubern des Terminalfensters
alias x='exit'  # Schnelles Beenden der aktuellen Shell
alias untar='tar -zxvf'  # Entpacken von .tar.gz Dateien
alias wget='wget -c'  # Download mit Fortsetzung der abgebrochenen Downloads
```

Damit die Änderungen wirksam werden, muss die .bashrc-Datei neu geladen werden:

```bash
source ~/.bashrc
```

## Apache Web Server Installation und Konfiguration

### Apache installieren

Apache ist ein bewährter und weit verbreiteter Webserver, der für das Hosting von Websites und Webanwendungen genutzt wird. Für dieses Projekt wurde Apache gewählt, um eine stabile und gut dokumentierte Plattform für die gemeinsame Projektarbeit zu bieten. Durch die Installation von Apache auf dem Raspberry Pi wird sichergestellt, dass das Entwicklerteam eine lokale Entwicklungsumgebung hat, die leicht zugänglich und konfigurierbar ist.

```bash
sudo apt update
sudo apt install apache2
```

### MariaDB installieren

MariaDB dient als robuste Datenbanklösung für zahlreiche Anwendungen. Die Installation beginnt mit einem Update der Paketquellen, gefolgt von der Installation des MariaDB-Servers.

Nach der Installation ist es wichtig, die Datenbanksicherheit zu verbessern, indem das Skript `mysql_secure_installation` ausgeführt wird. Dieses Skript hilft, einfache Sicherheitslücken wie das Entfernen anonymer Benutzer und das Deaktivieren des Remote-Root-Zugriffs zu schließen.

Die Überprüfung des Dienststatus mit `sudo systemctl status mariadb` bestätigt, dass MariaDB aktiv und funktionsfähig ist. Für eine direkte Interaktion mit der Datenbank kann man sich mit sudo `mysql -u root -p` anmelden und die MariaDB-Version mit `SHOW VARIABLES LIKE "%version%";` abfragen.

Abschließend wird ein Neustart des Dienstes mit `sudo systemctl restart mariadb` empfohlen, um alle Änderungen wirksam zu machen.

```bash
sudo apt update
sudo apt install mariadb-server
sudo mysql_secure_installation
sudo systemctl status mariadb
sudo mysql -u root -p
```

```sql
SHOW VARIABLES LIKE "%version%";
```

```bash
sudo systemctl restart mariadb
```

## Verzeichnis für gemeinsame Projektarbeit erstellen und Berechtigungen setzen

Es ist wichtig, dass alle Entwickler auf das Projekt zugreifen und daran arbeiten können. Dafür wurde ein zentrales Verzeichnis erstellt, das speziell für die Speicherung des Projekt-Codes vorgesehen ist. Durch die Vergabe von Gruppenberechtigungen kann jedes Teammitglied Dateien erstellen, bearbeiten und löschen, was eine kollaborative Arbeitsumgebung fördert.

```bash
sudo mkdir /opt/Snake
sudo chown root:developers /opt/Snake
sudo chmod 775 /opt/Snake
```

### Klonen des Projekts in das Verzeichnis

Das Hauptprojekt, ein Snake-Spiel, wurde aus einem zentralen Git-Repository in das zuvor erstellte Verzeichnis geklont. Dies stellt sicher, dass alle Entwickler Zugriff auf die neueste Version des Projekts haben und Änderungen in Echtzeit synchronisiert werden können.
Daher wurde das Projekt in das Verzeichnis `/opt/Snake` geklont.

```bash
cd /opt/Snake
sudo git clone https://github.com/SiemensHalske/Snake
```

## Konfigurieren des Apache Virtual Hosts

### HTTP Virtual Host einrichten

```bash
sudo nano /etc/apache2/sites-available/000-default.conf
```

Die Einrichtung des Virtual Hosts unter Apache ist entscheidend, um das Projekt unter einer bestimmten Domain verfügbar zu machen. Durch die Konfiguration des DocumentRoots auf das Projektverzeichnis wird Apache angewiesen, Anfragen für diese Domain von diesem spezifischen Ort aus zu bedienen. Dies ist besonders wichtig für die korrekte Verarbeitung von Webanfragen und die Darstellung der Inhalte.

```apache
DocumentRoot /opt/Snake
<Directory /opt/Snake>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
```

### HTTPS Virtual Host einrichten

```bash
sudo nano /etc/apache2/sites-available/default-ssl.conf
```

Um die Sicherheit der Datenübertragung zu gewährleisten, wurde HTTPS für das Projekt eingerichtet. Dies erfordert eine spezielle Konfiguration des SSL/TLS Virtual Hosts, die sicherstellt, dass alle Daten verschlüsselt übertragen werden. Die Verwendung von SSL-Zertifikaten ist hierbei essenziell, um die Authentizität und Integrität der Daten zu gewährleisten.

```apache
DocumentRoot /opt/Snake
SSLEngine on
SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem
SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
<Directory /opt/Snake>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
```

### Apache neustarten

Nachdem alle Konfigurationen vorgenommen wurden, ist es notwendig, den Apache-Webserver neu zu starten. Dies ermöglicht es Apache, alle neuen Einstellungen zu laden und anzuwenden. Ein Neustart ist oft erforderlich, um Änderungen wirksam zu machen und sicherzustellen, dass der Server ohne Konfigurationsfehler läuft.

```bash
sudo systemctl restart apache2
```

## Fehlerbehebung

### Überprüfen, ob Apache auf Port 443 lauscht

Um sicherzustellen, dass der HTTPS-Dienst korrekt eingerichtet wurde, ist es wichtig zu überprüfen, ob Apache auf dem Port 443 lauscht. Dies kann durch spezielle Befehle erfolgen, die die offenen Ports auf dem System anzeigen. Ein erfolgreicher Listen-Status auf Port 443 bestätigt, dass der SSL/TLS Virtual Host korrekt funktioniert.

```bash
sudo ss -tuln | grep ':443'
```

### Testen der HTTPS-Verbindung

Der letzte Schritt in der Fehlerbehebung ist das Testen der HTTPS-Verbindung. Dies kann einfach durchgeführt werden, indem man eine Anfrage an den Server sendet und überprüft, ob eine SSL-verschlüsselte Antwort zurückgegeben wird. Ein erfolgreicher Test bestätigt, dass der Webserver sicher und erreichbar ist.

```bash
curl -I https://snakegame.loseyourip.com
```
