# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Disable caps lock
# setxkbmap -option ctrl:nocaps

# Prevent the stupid stop-printing-terminal feature that I accidentaly hit with ctl+s
# recover with ctl+q
# stty -ixon

# export XDG_CONFIG_HOME="$HOME/.config"

alias space="du -h . | grep '[0-9\.]\+G'"
alias dc="docker-compose"
alias dcd="docker stop \$(docker ps -a -q); docker rm \$(docker ps -a -q); docker volume rm \$(docker volume ls -q); docker network rm \$(docker network ls -q)"
alias dp='docker ps -a --format "table {{.Names}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}"'
alias vim='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM='auto'
#export GIT_PS1_SHOWCOLORHINTS=true
export PS1='\[\033[38;5;37m\]\A\[\033[38;5;15m\] \[\033[38;5;33m\]\u\[\033[38;5;37m\]@\[\033[38;5;33m\]\h\[\033[38;5;15m\] \[\033[38;5;64m\]\W\[\033[38;5;136m\]$(__git_ps1 " (%s)")\[\033[38;5;245m\] \$\[\033[00m\] '
