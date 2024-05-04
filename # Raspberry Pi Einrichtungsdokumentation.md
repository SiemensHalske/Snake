# Raspberry Pi Einrichtungsdokumentation

## Einrichtung von hilfreichen Bash-Aliasen

Um die Arbeit in der Befehlszeile zu vereinfachen, können folgende Aliase in der `.bashrc`-Datei des Benutzers hinzugefügt werden:

```bash
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# meine standard aliase,
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

# System-Aliasen
alias top='htop'  # Nutze htop anstelle von top für eine detailliertere Ansicht (htop muss installiert sein)
alias meminfo='free -m -l -t'  # Zeige RAM- und Swap-Nutzung
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'  # Verbessertes Prozesssuchen

# Netzwerk-Aliasen
alias ports='netstat -tulanp'  # Zeige alle offenen Ports
alias ipinfo='curl ipinfo.io'  # Schnelle IP Adress- und Netzwerkinformationen von extern
alias myip='curl ipinfo.io/ip'  # Zeige nur die eigene externe IP-Adresse

# Git-Aliasen
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

Damit die Änderungen wirksam werden, muss die `.bashrc`-Datei neu geladen werden:

```bash
source ~/.bashrc
```
