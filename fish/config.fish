set PATH ~/bin ~/.miniconda2/bin $PATH

set -x FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

alias cdd='cd ~/repo/client/ios/'
alias cdb='cd ~/repo/b-cubed/'
alias cda='cd ~/repo/client/android/'
alias cdr='cd ~/repo/'

alias gitsuir='git submodule sync --recursive; and git submodule update --init --recursive'
alias gp='git pull; and gitsuir'
alias gs='git status'
alias gco='git checkout'


