# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color -h --group-directories-first'
alias gitsuir='git submodule sync --recursive && git submodule update --init --recursive'
alias gp='git pull'
alias gs='git status'
alias gco='git checkout'

EDITOR='vim'

#WHITE=`tput setaf 7`
#GREEN=`tput setaf 2`
#RED=`tput setaf 1`
#YELLOW=`tput setaf 3`
#MAGENTA=`tput setaf 5`
export PS1="\[\e[32m\]\A\[\e[m\] \[\e[31m\]\W\[\e[m\]\[\e[33m\]\$(__git_ps1)\[\e[m\]: "

#echo ".bashrc has run"
