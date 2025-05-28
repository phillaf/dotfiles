alias space="du -h . | grep '[0-9\.]\+G'"

alias cos="gh copilot suggest"
alias coe="gh copilot explain"

alias c="config"
alias ca="config add -A"
alias cs="config status"
alias cr="config difftool HEAD"

alias dc="docker-compose"
alias dcd="docker stop \$(docker ps -a -q); docker rm \$(docker ps -a -q); docker volume rm \$(docker volume ls -q); docker network rm \$(docker network ls -q)"
alias dp='docker ps -a --format "table {{.Names}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}"'


alias g='git'
alias ga='git add -A'
alias gs='git status'
alias gr='git difftool HEAD'

alias vim='nvim'
alias diff='nvim -d'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
