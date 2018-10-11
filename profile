# If not running interactively, don't do anything
[[ $- == *i* ]] || return


#echo ".profile has run"
export PATH=~/bin:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias ls='ls --group-directories-first'
alias cdd='cd ~/mymbig/'

alias gitsuir='git submodule sync --recursive && git submodule update --init --recursive'
alias gp='git pull && gitsuir'
alias gs='git status'
alias gco='git checkout'
alias github='env GIT_SSL_NO_VERIFY=true'
#alias vim='github vim'

EDITOR='vim'

WHITE=`tput setaf 7`
GREEN=`tput setaf 2`
RED=`tput setaf 1`
YELLOW=`tput setaf 3`
MAGENTA=`tput setaf 5`
PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u@\h\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "

export HISTSIZE=-1 
export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth:erasedups
export PLINK_CCACHE_DIR=~/mymbig/.cache/

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export TZ=/usr/share/zoneinfo/Europe/London
export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
