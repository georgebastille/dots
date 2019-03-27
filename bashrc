# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color -h --group-directories-first'

alias gitsuir='git submodule sync --recursive && git submodule update --init --recursive'
alias gp='git pull && gitsuir'
alias gs='git status'
alias gco='git checkout'

EDITOR='vim'

WHITE=`tput setaf 7`
GREEN=`tput setaf 2`
RED=`tput setaf 1`
YELLOW=`tput setaf 3`
MAGENTA=`tput setaf 5`
PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u@\h\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "

echo ".bashrc has run"
