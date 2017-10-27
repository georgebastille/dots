export PATH=~/bin:/Users/rhanes/miniconda2/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source ~/.fzf.bash
source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh
eval "$(register-python-argcomplete conda)"

manFunc() {
  open x-man-page://$1
}

#alias brew='https_proxy=http://proxyeu.bloomberg.com:80 http_proxy=http://proxyeu.bloomberg.com:80 brew'
alias man=manFunc
alias cdd='cd ~/repo/client/'
alias cda='cd ~/repo/'
alias cdr='cd ~/repo/'

alias gitsuir='git submodule sync --recursive && git submodule update --init --recursive'
alias gp='git pull && gitsuir'
alias gs='git status'
alias gco='git checkout'

WHITE=`tput setaf 7`
GREEN=`tput setaf 2`
RED=`tput setaf 1`
YELLOW=`tput setaf 3`
MAGENTA=`tput setaf 5`
PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "

