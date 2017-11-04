export PATH=~/bin:/Users/rhanes/miniconda2/bin:$PATH
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh
eval "$(register-python-argcomplete conda)"

manFunc() {
  open x-man-page://$1
}

alias man=manFunc
alias cdd='cd ~/repo/client/ios/'
alias cda='cd ~/repo/client/android/'
alias cdr='cd ~/repo/'

alias gitsuir='git submodule sync --recursive && git submodule update --init --recursive'
alias gp='noproxy && git pull && gitsuir'
alias gs='git status'
alias gco='git checkout'

WHITE=`tput setaf 7`
GREEN=`tput setaf 2`
RED=`tput setaf 1`
YELLOW=`tput setaf 3`
MAGENTA=`tput setaf 5`
PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u@\h\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "

proxy() {
  [ `pgrep openvpn` ] && export https_proxy=`cat ~/.proxy` || unset https_proxy
}

noproxy() {
  unset https_proxy
}

alias brew='proxy && brew && noproxy'
