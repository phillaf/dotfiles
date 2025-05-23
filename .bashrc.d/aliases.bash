alias space="du -h . | grep '[0-9\.]\+G'"
alias dc="docker-compose"
alias dcd="docker stop \$(docker ps -a -q); docker rm \$(docker ps -a -q); docker volume rm \$(docker volume ls -q); docker network rm \$(docker network ls -q)"
alias dp='docker ps -a --format "table {{.Names}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}"'
alias vim='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
