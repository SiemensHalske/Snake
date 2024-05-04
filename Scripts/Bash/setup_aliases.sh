#!/bin/bash

# Setup helpful bash aliases for all users
echo "Setting up bash aliases..."
cat << EOF >> /etc/bash.bashrc
# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Standard aliases for quick navigation and operation
alias c='clear'
alias cls='clear'
alias x='exit'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -h'

# System monitoring aliases
alias top='htop'
alias meminfo='free -m -l -t'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

# Network aliases
alias ports='netstat -tulanp'
alias ipinfo='curl ipinfo.io'
alias myip='curl ipinfo.io/ip'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gcl='git clone'
alias gco='git checkout'
alias gcb='git checkout -b'
alias glog='git log --oneline --decorate --graph --all'
EOF
